import 'package:flutter/material.dart';
import 'package:podipu/common/themes/text_styles.dart';
import 'package:podipu/shared/models/podcast.dart';

import '../../widgets/podcast_card.dart';

class PopularPodcastView extends StatelessWidget {
  const PopularPodcastView({
    super.key,
    required this.podcastList,
  });

  final List<Podcast> podcastList;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Popular Podcast',
            style: TStyles.sh2(),
          ),
        ),
        const SizedBox(height: 12),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              ...podcastList.map(
                (podcast) => PodcastCard(podcast: podcast),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
