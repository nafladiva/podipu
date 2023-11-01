import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:podipu/common/consts/size_const.dart';
import 'package:podipu/common/themes/text_styles.dart';
import 'package:podipu/features/player/cubits/player/player_cubit.dart';
import 'package:podipu/features/player/widgets/player_box.dart';
import 'package:podipu/shared/data/dummy_data.dart';

import 'views/views.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: BlocBuilder<PlayerCubit, PlayerState>(
        builder: (context, state) {
          return Scaffold(
            //TODO: check condition with if the audio is stored in state
            bottomSheet: state.isAudioExist
                ? PlayerBox(
                    //TODO: apply null safety
                    podcast: state.podcast!,
                  )
                : null,
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
                    const PopularPodcastView(
                      podcastList: DummyData.datas,
                    ),
                    const SizedBox(height: 40),
                    RecentlyPlayedView(
                      podcastList: DummyData.datas.reversed.toList(),
                    ),
                    const SizedBox(height: 60),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
