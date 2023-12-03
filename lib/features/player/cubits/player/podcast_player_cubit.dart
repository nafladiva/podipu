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
    // TODO: use loadStatus to UI

    if (state.episode?.id != episode.id) {
      emit(state.copyWith(loadStatus: const ViewState.loading()));

      if (player.playing) {
        stopAudio(player, onStopAudio: onStopPreviousAudio);
      }

      final session = await AudioSession.instance;
      await session.configure(const AudioSessionConfiguration.speech());

      // Listen to errors during playback.
      player.playbackEventStream.listen(
        (event) {},
        onError: (e, stackTrace) {
          print('A stream error occurred: $e');
        },
      );

      // Try to load audio from a source and catch any errors.
      try {
        // AAC example: https://dl.espressif.com/dl/audio/ff-16b-2c-44100hz.aac

        await player.setAudioSource(
          AudioSource.uri(Uri.parse(episode.audioUrl)),
          initialPosition: latestPosition,
        );
        emit(state.copyWith(episode: episode));

        playAudio(player);

        callback?.call();

        emit(state.copyWith(loadStatus: const ViewState.success()));
      } catch (e) {
        print('Error loading audio source: $e');
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
