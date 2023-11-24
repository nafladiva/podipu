import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:podipu/common/themes/text_styles.dart';

import '../../cubit/home_cubit.dart';
import '../widgets/podcast_card.dart';

class PopularPodcastView extends StatelessWidget {
  const PopularPodcastView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state.bestPodcastLoadStatus.isLoading) {
          return const CircularProgressIndicator();
        }

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
                  ...state.bestPodcastList.map(
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
