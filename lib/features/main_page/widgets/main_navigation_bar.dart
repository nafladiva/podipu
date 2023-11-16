import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:podipu/common/themes/colors.dart';

import '../cubit/main_cubit.dart';

class MainNavigationBar extends StatelessWidget {
  const MainNavigationBar({
    super.key,
    this.onTap,
  });

  final Function(int)? onTap;

  @override
  Widget build(BuildContext context) {
    final mainCubit = context.read<MainCubit>();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // BlocBuilder<PodcastPlayerCubit, PodcastPlayerState>(
        //   builder: (context, state) {
        //     if (!state.isAudioExist) return const SizedBox();

        //     return PlayerBox(podcast: state.podcast!);
        //   },
        // ),
        BlocBuilder<MainCubit, MainState>(
          builder: (context, state) {
            return BottomNavigationBar(
              backgroundColor: MyColor.shadow,
              currentIndex: state.currentIndex,
              onTap: (index) {
                mainCubit.onChangeIndex(index);
                onTap?.call(index);
              },
              iconSize: 20.0,
              selectedFontSize: 12.0,
              unselectedFontSize: 10.0,
              elevation: 0,
              items: const [
                BottomNavigationBarItem(
                  label: 'Home',
                  icon: Icon(Icons.home_filled),
                ),
                BottomNavigationBarItem(
                  label: 'Saved',
                  icon: Icon(Icons.bookmark),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
