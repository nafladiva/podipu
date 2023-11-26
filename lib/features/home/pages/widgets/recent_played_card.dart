import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:podipu/common/themes/colors.dart';
import 'package:podipu/common/themes/text_styles.dart';
import 'package:podipu/features/player/player.dart';
import 'package:podipu/shared/data/models/recent_played_mdl.dart';

class RecentPlayedCard extends StatelessWidget {
  const RecentPlayedCard({
    super.key,
    required this.recent,
  });

  final RecentPlayedMdl recent;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: InkWell(
        onTap: () {
          PersistentNavBarNavigator.pushDynamicScreen(
            context,
            screen: MaterialPageRoute(
              builder: (_) => PlayerPage(episode: recent.episode),
              fullscreenDialog: true,
            ),
            withNavBar: false,
          );
        },
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                imageUrl: recent.episode.imageUrl,
                placeholder: (_, __) => const CircularProgressIndicator(),
                errorWidget: (_, __, ___) => const Icon(Icons.error),
                width: 120.0,
                height: 120.0,
              ),
            ),
            SizedBox(
              width: 120.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Text(
                    recent.episode.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TStyles.p1(),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    recent.episode.podcast?.title ?? '',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TStyles.p1(color: MyColor.primaryPink),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
