import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:podipu/common/themes/text_styles.dart';
import 'package:podipu/features/player/player.dart';

class PodcastCard extends StatelessWidget {
  const PodcastCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: InkWell(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const PlayerPage()),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                imageUrl: "http://via.placeholder.com/150x150",
                placeholder: (_, __) => const CircularProgressIndicator(),
                errorWidget: (_, __, ___) => const Icon(Icons.error),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Morning podcast',
              style: TStyles.p1(),
            )
          ],
        ),
      ),
    );
  }
}
