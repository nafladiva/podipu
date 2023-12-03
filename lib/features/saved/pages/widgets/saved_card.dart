import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:podipu/common/themes/colors.dart';
import 'package:podipu/common/themes/text_styles.dart';
import 'package:podipu/features/player/player.dart';
import 'package:podipu/shared/data/models/episode_mdl.dart';

class SavedCard extends StatelessWidget {
  const SavedCard({
    super.key,
    required this.episode,
    this.latestTimestamp,
  });

  final EpisodeMdl episode;
  final Duration? latestTimestamp;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: () => PersistentNavBarNavigator.pushDynamicScreen(
          context,
          screen: MaterialPageRoute(
            builder: (_) => PlayerPage(
              episode: episode,
              latestTimestamp: latestTimestamp,
            ),
            fullscreenDialog: true,
          ),
          withNavBar: false,
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 14,
          ),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.05),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: CachedNetworkImage(
                  imageUrl: episode.imageUrl,
                  placeholder: (_, __) => const CircularProgressIndicator(),
                  errorWidget: (_, __, ___) => const Icon(Icons.error),
                  width: 70.0,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      episode.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TStyles.sh2(),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      episode.podcast?.publisher ?? '',
                      style: TStyles.p1(color: MyColor.primaryPink),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
