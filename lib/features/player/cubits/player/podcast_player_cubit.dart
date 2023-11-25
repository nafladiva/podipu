import 'package:audio_session/audio_session.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:podipu/common/themes/colors.dart';
import 'package:podipu/features/home/cubit/home_cubit.dart';
import 'package:podipu/shared/data/models/episode_mdl.dart';
import 'package:podipu/shared/utils/image_util.dart';

import '../../repositories/player_repository.dart';

part 'podcast_player_state.dart';

class PodcastPlayerCubit extends Cubit<PodcastPlayerState> {
  final PlayerRepository repository;
  final HomeCubit homeCubit;

  PodcastPlayerCubit({
    required this.repository,
    required this.homeCubit,
  }) : super(const PodcastPlayerState());

  Future<void> initAudio(
    AudioPlayer player, {
    required EpisodeMdl episode,
  }) async {
    //TODO: add network states

    if (state.episode?.id != episode.id) {
      if (player.playing) {
        stopAudio(player);
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

        // await player.setAudioSource(AudioSource.uri(Uri.parse(audioUrl)));
        await player.setAudioSource(
          AudioSource.uri(Uri.parse(episode.audioUrl)),
        );
        emit(state.copyWith(episode: episode));

        playAudio(player);
      } catch (e) {
        print('Error loading audio source: $e');
      }
    }
  }

  void playAudio(AudioPlayer player) async {
    if (state.episode != null) {
      setToRecentPlayed(episode: state.episode!);
    }

    player.play();
    emit(state.copyWith(isPlaying: true));
  }

  void pauseAudio(AudioPlayer player) {
    // TODO: save the latest time stamp

    player.pause();
    emit(state.copyWith(isPlaying: false));
  }

  void stopAudio(AudioPlayer player) {
    player.stop();
  }

  Future<void> setBackgroundColor(String imagePath) async {
    final dominantColor = await ImageUtil.getDominantColor(imagePath);

    emit(state.copyWith(
      backgroundColor: dominantColor.withOpacity(0.5),
    ));
  }

  Future<void> setToRecentPlayed({
    required EpisodeMdl episode,
    Duration? latestTimestamp,
  }) async {
    try {
      await repository.setAudioToRecentPlayed(
        episode: episode,
        latestTimestamp: latestTimestamp,
      );
    } catch (_) {}
  }
}
