import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:podipu/common/consts/size_const.dart';
import 'package:podipu/common/themes/text_styles.dart';
import 'package:podipu/data/models/podcast_mdl.dart';
import 'package:podipu/shared/widgets/my_app_bar.dart';
import 'package:podipu/shared/widgets/my_shimmer_loader.dart';

import '../widgets/episode_item.dart';
import '../widgets/info_badge.dart';

class PodcastDetailPage extends StatelessWidget {
  const PodcastDetailPage({
    super.key,
    required this.podcast,
  });

  final PodcastMdl podcast;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: SizeConst.kMarginX,
              vertical: SizeConst.kMarginY,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: CachedNetworkImage(
                        imageUrl: podcast.imageUrl,
                        placeholder: (_, __) => const MyShimmerLoader(
                          width: 120.0,
                          height: 120.0,
                        ),
                        errorWidget: (_, __, ___) => const Icon(Icons.error),
                        width: 120.0,
                      ),
                      // child: Image.asset(
                      //   AssetPath.starboyCoverImg,
                      //   width: 120.0,
                      // ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            podcast.title,
                            style: TStyles.sh1(),
                          ),
                          const SizedBox(height: 6.0),
                          Text(
                            podcast.publisher,
                            style: TStyles.p2(),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 24.0),
                Text(
                  '🎯 ABOUT THIS PODCAST',
                  style: TStyles.sh1(),
                ),
                const SizedBox(height: 8.0),
                Text(
                  podcast.description,
                  style: TStyles.p2(),
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: [
                    InfoBadge(
                      text: podcast.language,
                      icon: Icons.language,
                    ),
                    InfoBadge(
                      text: podcast.country,
                      icon: Icons.location_on,
                    ),
                    InfoBadge(
                      text: 'Daily',
                      icon: Icons.update,
                    ),
                    InfoBadge(
                      text: podcast.type,
                      icon: Icons.info,
                    ),
                  ],
                ),
                const SizedBox(height: 12.0),
                const Divider(),
                const SizedBox(height: 12.0),
                Text(
                  '🔥 LATEST EPISODE',
                  style: TStyles.sh1(),
                ),
                const SizedBox(height: 12.0),
                EpisodeItem(
                  episode: podcast.episodes.first,
                ),
                const SizedBox(height: 12.0),
                Text(
                  '📒 PREVIOUS EPISODES',
                  style: TStyles.sh1(),
                ),
                const SizedBox(height: 12.0),
                ...podcast.episodes.skip(1).map(
                      (episode) => EpisodeItem(episode: episode),
                    ),
                // const EpisodeItem(),
                // const EpisodeItem(),
                // const EpisodeItem(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
