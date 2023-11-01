// import 'package:cached_network_image/cached_network_image.dart';s
import 'package:flutter/material.dart';
import 'package:podipu/common/themes/text_styles.dart';
import 'package:podipu/features/player/player.dart';
import 'package:podipu/shared/models/podcast.dart';

class PodcastCard extends StatelessWidget {
  const PodcastCard({
    super.key,
    required this.podcast,
  });

  final Podcast podcast;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: InkWell(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => PlayerPage(podcast: podcast),
            fullscreenDialog: true,
          ),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              //TODO: change back to CachedNetworkImage, Image.asset only for testing
              child: Image.asset(
                podcast.coverPath,
                width: 150.0,
              ),
              // child: CachedNetworkImage(
              //   imageUrl: "http://via.placeholder.com/150x150",
              //   placeholder: (_, __) => const CircularProgressIndicator(),
              //   errorWidget: (_, __, ___) => const Icon(Icons.error),
              // ),
            ),
            const SizedBox(height: 8),
            Text(
              podcast.title,
              style: TStyles.p1(),
            )
          ],
        ),
      ),
    );
  }
}
