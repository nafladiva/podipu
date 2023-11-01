import 'package:audio_session/audio_session.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:podipu/common/themes/colors.dart';
import 'package:podipu/shared/models/podcast.dart';
import 'package:podipu/shared/utils/image_util.dart';

part 'player_state.dart';

class PlayerCubit extends Cubit<PlayerState> {
  PlayerCubit() : super(const PlayerState());

  Future<void> initAudio(
    AudioPlayer player, {
    required Podcast podcast,
  }) async {
    //TODO: add network states

    if (state.podcast?.id != podcast.id) {
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
        await player.setAudioSource(AudioSource.asset(podcast.audioPath));
        emit(state.copyWith(podcast: podcast));

        playAudio(player);
      } catch (e) {
        print('Error loading audio source: $e');
      }
    }
  }

  void playAudio(AudioPlayer player) {
    player.play();
    emit(state.copyWith(isPlaying: true));
  }

  void pauseAudio(AudioPlayer player) {
    player.pause();
    emit(state.copyWith(isPlaying: false));
  }

  void stopAudio(AudioPlayer player) {
    player.stop();
  }

  Future<void> setBackgroundColor(String imagePath) async {
    final dominantColor = await ImageUtil.getDominantColor(imagePath);

    emit(state.copyWith(
      backgroundColor: dominantColor,
    ));
  }
}
