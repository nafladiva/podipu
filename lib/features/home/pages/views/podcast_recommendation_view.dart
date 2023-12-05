import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:podipu/common/themes/text_styles.dart';

import '../../cubit/home_cubit.dart';
import '../widgets/card_list_loader.dart';
import '../widgets/podcast_card.dart';

class PodcastRecommendationView extends StatelessWidget {
  const PodcastRecommendationView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final selectedPodcast = state.selectedPodcastForRecommendation;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Recommendation Podcasts',
                    style: TStyles.sh2(),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'some recommendation based on ${selectedPodcast?.title} podcast',
                    style: TStyles.p2(),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: (state.podcastRecommendationLoadStatus.isLoading)
                  ? const CardListLoader()
                  : Row(
                      children: [
                        ...state.podcastRecommendationList.map(
                          (podcast) => PodcastCard(podcast: podcast),
                        ),
                      ],
                    ),
            ),
          ],
        );
      },
    );
  }
}
