import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:podipu/common/themes/colors.dart';
import 'package:podipu/common/themes/text_styles.dart';
import 'package:podipu/features/player/player.dart';
import 'package:podipu/shared/data/models/recent_played_mdl.dart';
import 'package:podipu/shared/utils/image_util.dart';

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
              builder: (_) => PlayerPage(
                episode: recent.episode,
                latestTimestamp: recent.latestTimestamp,
              ),
              fullscreenDialog: true,
            ),
            withNavBar: false,
          );
        },
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: ImageUtil.buildCachedNetworkImage(
                url: recent.episode.imageUrl,
                width: 120.0,
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
