import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart' as au;
import 'package:podipu/common/themes/colors.dart';
import 'package:podipu/common/themes/text_styles.dart';
import 'package:podipu/features/player/cubits/player/player_cubit.dart';
import 'package:podipu/injection.dart';
import 'package:podipu/shared/models/podcast.dart';

import '../pages/player_page.dart';

class PlayerBox extends StatelessWidget {
  const PlayerBox({
    super.key,
    required this.podcast,
  });

  final Podcast podcast;

  @override
  Widget build(BuildContext context) {
    final playerCubit = context.read<PlayerCubit>();
    final player = locator<au.AudioPlayer>();

    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => PlayerPage(podcast: podcast),
          fullscreenDialog: true,
        ),
      ),
      child: Container(
        // margin: EdgeInsets.symmetric(
        //   horizontal: SizeConst.kMarginX,
        //   vertical: SizeConst.kMarginY,
        // ),
        padding: const EdgeInsets.all(24.0),
        decoration: BoxDecoration(
          color: MyColor.shadow,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(4.0),
              child: Image.asset(
                podcast.coverPath,
                width: 50,
              ),
            ),
            const SizedBox(width: 12.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    podcast.title,
                    style: TStyles.sh1(),
                  ),
                  Text(
                    podcast.artist,
                    style: TStyles.p1(),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12.0),
            BlocBuilder<PlayerCubit, PlayerState>(
              bloc: playerCubit,
              builder: (context, state) {
                return IconButton(
                  onPressed: () => state.isPlaying
                      ? playerCubit.pauseAudio(player)
                      : playerCubit.playAudio(player),
                  icon: Icon(
                    state.isPlaying ? Icons.pause : Icons.play_arrow,
                    size: 30,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
