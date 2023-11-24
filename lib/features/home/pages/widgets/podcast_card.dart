import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:podipu/common/themes/text_styles.dart';
import 'package:podipu/shared/data/models/podcast_mdl.dart';
import 'package:podipu/features/podcast_detail/podcast_detail.dart';
import 'package:podipu/shared/data/dummy_data.dart';

class PodcastCard extends StatelessWidget {
  const PodcastCard({
    super.key,
    required this.podcast,
  });

  final PodcastMdl podcast;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: InkWell(
        onTap: () {
          PersistentNavBarNavigator.pushNewScreen(
            context,
            screen: const PodcastDetailPage(
              podcast: DummyData.podcast,
            ),
          );
        },
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                imageUrl: podcast.imageUrl,
                placeholder: (_, __) => const CircularProgressIndicator(),
                errorWidget: (_, __, ___) => const Icon(Icons.error),
                width: 150.0,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: 150.0,
              child: Text(
                podcast.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TStyles.p1(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
