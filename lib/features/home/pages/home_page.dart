import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:podipu/common/consts/size_const.dart';
import 'package:podipu/common/themes/text_styles.dart';
import 'package:podipu/features/home/repositories/home_repository.dart';
import 'package:podipu/features/player/cubits/player/podcast_player_cubit.dart';

import '../cubit/home_cubit.dart';
import 'views/just_listen_view.dart';
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
    return BlocProvider.value(
      value: homeCubit,
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: BlocBuilder<PodcastPlayerCubit, PodcastPlayerState>(
          builder: (context, state) {
            return Scaffold(
              body: SafeArea(
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
                      const PopularPodcastView(),
                      const SizedBox(height: 40),
                      const JustListenView(),
                      // RecentlyPlayedView(
                      //   podcastList: DummyData.datas.reversed.toList(),
                      // ),
                      const SizedBox(height: 60),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
