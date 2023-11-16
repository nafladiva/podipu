import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:podipu/common/themes/colors.dart';
import 'package:podipu/features/home/home.dart';
import 'package:podipu/features/player/cubits/player/podcast_player_cubit.dart';
import 'package:podipu/features/player/widgets/player_box.dart';
import 'package:podipu/injection.dart';
import 'package:podipu/shared/consts/my_const.dart';

import '../cubit/main_cubit.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final mainCubit = locator<MainCubit>();
  // late PageController pageController;
  late PersistentTabController controller;

  @override
  void initState() {
    super.initState();
    // pageController = PageController();
    controller = PersistentTabController();
  }

  @override
  void dispose() {
    // pageController.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PersistentTabView(
            context,
            controller: controller,
            backgroundColor: MyColor.shadow,
            screens: const [
              HomePage(),
              Scaffold(
                body: Center(
                  child: Text('Saved podcasts'),
                ),
              ),
            ],
            items: [
              PersistentBottomNavBarItem(
                title: 'Home',
                icon: const Icon(Icons.home_filled),
                activeColorPrimary: MyColor.primary,
              ),
              PersistentBottomNavBarItem(
                title: 'Saved',
                icon: const Icon(Icons.bookmark),
                activeColorPrimary: MyColor.primary,
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
              bottom: MyConst.bottomNavHeight +
                  MediaQuery.of(context).padding.bottom,
            ),
            child: BlocBuilder<PodcastPlayerCubit, PodcastPlayerState>(
              builder: (context, state) {
                if (!state.isAudioExist) return const SizedBox();

                return PlayerBox(podcast: state.podcast!);
              },
            ),
          ),
        ],
      ),
    );
  }
}
