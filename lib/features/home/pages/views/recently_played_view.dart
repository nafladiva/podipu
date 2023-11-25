import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:podipu/common/themes/text_styles.dart';

import '../../cubit/home_cubit.dart';
import '../widgets/recent_played_card.dart';

class RecentlyPlayedView extends StatelessWidget {
  const RecentlyPlayedView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state.recentPlayedLoadStatus.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state.recentPlayedList.isEmpty) {
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
              child: Row(
                children: [
                  ...state.recentPlayedList.map(
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
