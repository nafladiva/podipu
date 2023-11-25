import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:podipu/common/themes/colors.dart';
import 'package:podipu/common/themes/text_styles.dart';
import 'package:podipu/features/player/cubits/player/podcast_player_cubit.dart';
import 'package:podipu/injection.dart';
import 'package:podipu/shared/data/models/episode_mdl.dart';

import '../player_page.dart';

class PlayerBox extends StatelessWidget {
  const PlayerBox({
    super.key,
    required this.episode,
  });

  final EpisodeMdl episode;

  @override
  Widget build(BuildContext context) {
    final playerCubit = context.read<PodcastPlayerCubit>();
    final player = locator<AudioPlayer>();

    return InkWell(
      onTap: () => PersistentNavBarNavigator.pushDynamicScreen(
        context,
        screen: MaterialPageRoute(
          builder: (_) => PlayerPage(episode: episode),
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
              child: CachedNetworkImage(
                imageUrl: episode.imageUrl,
                placeholder: (_, __) => const CircularProgressIndicator(),
                errorWidget: (_, __, ___) => const Icon(Icons.error),
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
                    episode.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TStyles.sh2(),
                  ),
                  Text(
                    episode.podcast?.publisher ?? '',
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
