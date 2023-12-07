import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:podipu/common/themes/colors.dart';
import 'package:podipu/common/themes/text_styles.dart';
import 'package:podipu/features/podcast_detail/podcast_detail.dart';
import 'package:podipu/shared/data/models/podcast_mdl.dart';
import 'package:podipu/shared/utils/image_util.dart';

class PodcastGenreCard extends StatelessWidget {
  const PodcastGenreCard({
    super.key,
    required this.podcast,
  });

  final PodcastMdl podcast;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        PersistentNavBarNavigator.pushNewScreen(
          context,
          screen: PodcastDetailPage(id: podcast.id),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
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
              child: ImageUtil.buildCachedNetworkImage(
                url: podcast.imageUrl,
                width: 70.0,
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    podcast.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TStyles.sh2(),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    podcast.publisher,
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
