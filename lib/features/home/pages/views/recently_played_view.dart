import 'package:flutter/material.dart';
import 'package:podipu/common/themes/text_styles.dart';

import '../../widgets/podcast_card.dart';

class RecentlyPlayedView extends StatelessWidget {
  const RecentlyPlayedView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Recently Played',
            style: TStyles.sh2(),
          ),
        ),
        const SizedBox(height: 12),
        const SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              PodcastCard(),
              PodcastCard(),
              PodcastCard(),
              PodcastCard(),
            ],
          ),
        ),
      ],
    );
  }
}
