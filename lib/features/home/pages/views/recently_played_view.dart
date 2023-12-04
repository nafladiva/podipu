import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:podipu/common/themes/text_styles.dart';
import 'package:podipu/features/recent_played/cubit/recent_played_cubit.dart';

import '../widgets/card_list_loader.dart';
import '../widgets/recent_played_card.dart';

class RecentlyPlayedView extends StatelessWidget {
  const RecentlyPlayedView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecentPlayedCubit, RecentPlayedState>(
      builder: (context, state) {
        if (state.recentList.isEmpty) {
          return const SizedBox();
        }

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
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: (state.loadStatus.isLoading)
                  ? const CardListLoader(
                      itemWidth: 120.0,
                    )
                  : Row(
                      children: [
                        ...state.recentList.map(
                          (recent) => RecentPlayedCard(recent: recent),
                        ),
                      ],
                    ),
            ),
            const SizedBox(height: 40),
          ],
        );
      },
    );
  }
}
