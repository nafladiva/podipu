import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:podipu/common/consts/size_const.dart';
import 'package:podipu/common/themes/text_styles.dart';
import 'package:podipu/features/genre/cubit/genre_cubit.dart';
import 'package:podipu/features/genre/pages/view/genre_search_bar.dart';
import 'package:podipu/features/home/repositories/home_repository.dart';
import 'package:podipu/features/player/cubits/player/podcast_player_cubit.dart';
import 'package:podipu/features/recent_played/cubit/recent_played_cubit.dart';

import '../cubit/home_cubit.dart';
import 'views/just_listen_view.dart';
import 'views/podcast_recommendation_view.dart';
import 'views/views.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeCubit homeCubit;

  @override
  void initState() {
    super.initState();
    homeCubit = HomeCubit(repository: HomeRepositoryImpl());
    homeCubit.onBuild();
  }

  @override
  void dispose() {
    homeCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final recentPlayedCubit = context.read<RecentPlayedCubit>();
    final genreCubit = context.read<GenreCubit>();

    return BlocProvider.value(
      value: homeCubit,
      child: BlocBuilder<PodcastPlayerCubit, PodcastPlayerState>(
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
              child: RefreshIndicator(
                onRefresh: () async {
                  await homeCubit.onBuild();
                  await recentPlayedCubit.getRecentPlayed();
                  await genreCubit.onBuild();
                },
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                    vertical: SizeConst.kMarginY,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: SizeConst.kMarginX,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hola!👋🏻✨',
                              style: TStyles.h1(),
                            ),
                            Text(
                              'what kind of podcast you wanna hear?',
                              style: TStyles.p1(),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 40),
                      const GenreSearchBar(),
                      const SizedBox(height: 30),
                      const PopularPodcastView(),
                      const SizedBox(height: 40),
                      const RecentlyPlayedView(),
                      const JustListenView(),
                      const SizedBox(height: 40),
                      const PodcastRecommendationView(),
                      const SizedBox(height: 80),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
