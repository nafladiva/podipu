import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:podipu/common/themes/text_styles.dart';
import 'package:podipu/shared/consts/hive_key.dart';
import 'package:podipu/shared/data/local_storage/hive_local_storage.dart';
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
        onTap: () async {
          // TODO: need to adjust onTap

          await HiveLocalStorage.remove(
            boxName: HiveKey.recentPlayedBoxKey,
            key: recent.episode.id,
          );
          // PersistentNavBarNavigator.pushNewScreen(
          //   context,
          //   screen: PodcastDetailPage(id: podcast.id),
          // );
        },
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                imageUrl: recent.episode.imageUrl,
                placeholder: (_, __) => const CircularProgressIndicator(),
                errorWidget: (_, __, ___) => const Icon(Icons.error),
                width: 150.0,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: 150.0,
              child: Text(
                recent.episode.title,
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
