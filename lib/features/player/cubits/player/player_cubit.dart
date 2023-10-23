import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:podipu/common/themes/colors.dart';
import 'package:podipu/shared/utils/image_util.dart';

part 'player_state.dart';

class PlayerCubit extends Cubit<PlayerState> {
  PlayerCubit() : super(const PlayerState());

  Future<void> initAudio(
    AudioPlayer player, {
    required String audioUrl,
  }) async {
    //TODO: add states

    try {
      await player.setAudioSource(AudioSource.uri(Uri.parse(audioUrl)));
    } catch (e) {
      print('Error loading audio source: $e');
    }
  }

  void playAudio(AudioPlayer player) {}

  void stopAudio(AudioPlayer player) {}

  Future<void> setBackgroundColor(String imagePath) async {
    final dominantColor = await ImageUtil.getDominantColor(imagePath);
    emit(state.copyWith(
      backgroundColor: dominantColor,
    ));
  }
}
