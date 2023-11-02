import 'package:flutter/material.dart';
import 'package:podipu/common/consts/size_const.dart';
import 'package:podipu/common/themes/text_styles.dart';
import 'package:podipu/shared/consts/asset_path.dart';
import 'package:podipu/shared/widgets/my_app_bar.dart';

import '../widgets/episode_item.dart';
import '../widgets/info_badge.dart';

class PodcastDetailPage extends StatelessWidget {
  const PodcastDetailPage({super.key});

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
                      child: Image.asset(
                        AssetPath.starboyCoverImg,
                        width: 120.0,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Rolling Stone | Cumulus Podcast Network',
                            style: TStyles.sh1(),
                          ),
                          const SizedBox(height: 6.0),
                          Text(
                            'rollingstone.com',
                            style: TStyles.p2(),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 24.0),
                Text(
                  'ABOUT THIS PODCAST',
                  style: TStyles.sh1(),
                ),
                const SizedBox(height: 8.0),
                Text(
                  'Inside the biggest stories in music, hosted by Rolling Stone senior writer Brian Hiatt. Featuring interviews with top artists, expert insight on new releases and breaking news from the Rolling Stone staff, and much more.',
                  style: TStyles.p2(),
                ),
                const SizedBox(height: 12),
                const Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: [
                    InfoBadge(
                      text: 'English',
                      icon: Icons.language,
                    ),
                    InfoBadge(
                      text: 'United States',
                      icon: Icons.location_on,
                    ),
                    InfoBadge(
                      text: 'Weekly',
                      icon: Icons.update,
                    ),
                    InfoBadge(
                      text: 'Episodic',
                      icon: Icons.info,
                    ),
                  ],
                ),
                const SizedBox(height: 12.0),
                const Divider(),
                const SizedBox(height: 12.0),
                Text(
                  '🎉 LATEST EPISODE',
                  style: TStyles.sh1(),
                ),
                const SizedBox(height: 12.0),
                const EpisodeItem(),
                const SizedBox(height: 12.0),
                Text(
                  'PREVIOUS EPISODES',
                  style: TStyles.sh1(),
                ),
                const SizedBox(height: 12.0),
                const EpisodeItem(),
                const EpisodeItem(),
                const EpisodeItem(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
