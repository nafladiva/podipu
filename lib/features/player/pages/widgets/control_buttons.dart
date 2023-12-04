import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:podipu/common/themes/colors.dart';
import 'package:podipu/features/player/cubits/player/podcast_player_cubit.dart';

class ControlButtons extends StatelessWidget {
  final AudioPlayer player;

  const ControlButtons({
    Key? key,
    required this.player,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final playerCubit = context.read<PodcastPlayerCubit>();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // replay previous 10 seconds
          IconButton(
            icon: const Icon(
              Icons.replay_10_rounded,
              size: 28,
            ),
            onPressed: () {
              final currentDuration = player.position;

              if (currentDuration.inSeconds > 10) {
                player.seek(Duration(seconds: currentDuration.inSeconds - 10));
              }
            },
          ),

          /// This StreamBuilder rebuilds whenever the player state changes, which
          /// includes the playing/paused state and also the
          /// loading/buffering/ready state. Depending on the state we show the
          /// appropriate button or loading indicator.
          StreamBuilder<PlayerState>(
            stream: player.playerStateStream,
            builder: (context, snapshot) {
              final playerState = snapshot.data;
              final processingState = playerState?.processingState;
              final playing = playerState?.playing;

              if (processingState == ProcessingState.loading ||
                  processingState == ProcessingState.buffering) {
                return Container(
                  margin: const EdgeInsets.all(8.0),
                  width: 64.0,
                  height: 64.0,
                  child: const CircularProgressIndicator(
                    color: MyColor.primaryPink,
                  ),
                );
              } else if (playing != true) {
                return IconButton(
                  icon: const Icon(Icons.play_arrow),
                  iconSize: 64.0,
                  onPressed: () => playerCubit.playAudio(player),
                );
              } else if (processingState != ProcessingState.completed) {
                return IconButton(
                  icon: const Icon(Icons.pause),
                  iconSize: 64.0,
                  onPressed: () => playerCubit.pauseAudio(player),
                );
              } else {
                return IconButton(
                  icon: const Icon(Icons.replay),
                  iconSize: 64.0,
                  onPressed: () => player.seek(Duration.zero),
                );
              }
            },
          ),

          // skip to next 10 seconds
          IconButton(
            icon: const Icon(
              Icons.forward_10_rounded,
              size: 28,
            ),
            onPressed: () {
              final currentDuration = player.position;

              player.seek(Duration(seconds: currentDuration.inSeconds + 10));
            },
          ),
        ],
      ),
    );
  }
}
