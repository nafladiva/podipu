import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:podipu/common/themes/colors.dart';
import 'package:podipu/common/themes/text_styles.dart';
import 'package:podipu/features/player/cubits/player/podcast_player_cubit.dart';
import 'package:podipu/injection.dart';
import 'package:podipu/shared/data/models/podcast.dart';

import '../pages/player_page.dart';

class PlayerBox extends StatelessWidget {
  const PlayerBox({
    super.key,
    required this.podcast,
  });

  final Podcast podcast;

  @override
  Widget build(BuildContext context) {
    final playerCubit = context.read<PodcastPlayerCubit>();
    final player = locator<AudioPlayer>();

    return InkWell(
      onTap: () => PersistentNavBarNavigator.pushDynamicScreen(
        context,
        screen: MaterialPageRoute(
          builder: (_) => PlayerPage(podcast: podcast),
          fullscreenDialog: true,
        ),
        withNavBar: false,
      ),
      child: Container(
        margin: const EdgeInsets.all(12),
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 18.0),
        decoration: BoxDecoration(
          color: MyColor.dark,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(4.0),
              child: Image.asset(
                podcast.coverPath,
                width: 40,
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
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TStyles.sh2(),
                  ),
                  Text(
                    podcast.artist,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TStyles.p2(),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12.0),
            BlocBuilder<PodcastPlayerCubit, PodcastPlayerState>(
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
