import 'package:audio_session/audio_session.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:podipu/common/themes/colors.dart';
import 'package:podipu/shared/data/models/episode_mdl.dart';
import 'package:podipu/shared/states/view_states.dart';
import 'package:podipu/shared/utils/image_util.dart';

part 'podcast_player_state.dart';

class PodcastPlayerCubit extends Cubit<PodcastPlayerState> {
  PodcastPlayerCubit()
      : super(const PodcastPlayerState(loadStatus: ViewState.initial()));

  Future<void> initAudio(
    AudioPlayer player, {
    required EpisodeMdl episode,
    Duration? latestPosition,
    VoidCallback? callback,
    Function(EpisodeMdl?, Duration)? onStopPreviousAudio,
  }) async {
    if (state.episode?.id != episode.id) {
      emit(state.copyWith(loadStatus: const ViewState.loading()));

      if (player.playing) {
        stopAudio(player, onStopAudio: onStopPreviousAudio);
      }

      emit(state.copyWith(episode: episode));

      final session = await AudioSession.instance;
      await session.configure(const AudioSessionConfiguration.speech());

      // listen to errors during playback
      player.playbackEventStream.listen(
        (event) {},
        onError: (e, stackTrace) {},
      );

      // load audio from its url
      try {
        await player.setAudioSource(
          AudioSource.uri(Uri.parse(episode.audioUrl)),
          initialPosition: latestPosition,
        );

        playAudio(player);

        callback?.call();

        emit(state.copyWith(loadStatus: const ViewState.success()));
      } catch (e) {
        emit(state.copyWith(loadStatus: const ViewState.failed()));
      }
    }
  }

  void playAudio(AudioPlayer player) async {
    player.play();
    emit(state.copyWith(isPlaying: true));
  }

  void pauseAudio(AudioPlayer player) {
    player.pause();
    emit(state.copyWith(isPlaying: false));
  }

  void stopAudio(
    AudioPlayer player, {
    Function(EpisodeMdl?, Duration)? onStopAudio,
  }) {
    onStopAudio?.call(state.episode, player.position);
    player.stop();
  }

  Future<void> setBackgroundColor(String imagePath) async {
    final dominantColor = await ImageUtil.getDominantColor(imagePath);

    emit(state.copyWith(
      backgroundColor: dominantColor.withOpacity(0.75),
    ));
  }

  void setSavedStatus(bool isSaved) {
    emit(state.copyWith(isSaved: isSaved));
  }
}
