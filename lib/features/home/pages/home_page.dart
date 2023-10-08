import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:podipu/common/consts/size_const.dart';
import 'package:podipu/common/themes/text_styles.dart';

import 'views/views.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
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
                const RecentlyPlayedView(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
