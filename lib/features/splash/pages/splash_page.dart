import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:podipu/common/themes/colors.dart';
import 'package:podipu/common/themes/text_styles.dart';
import 'package:podipu/features/main_page/cubit/main_cubit.dart';
import 'package:podipu/features/main_page/pages/main_page.dart';
import 'package:podipu/shared/consts/asset_path.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<MainCubit, MainState>(
      listener: (context, state) {
        if (!state.isShowSplash) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const MainPage()),
          );
        }
      },
      child: Scaffold(
        backgroundColor: MyColor.background,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AssetPath.appIcon,
                width: 275,
              ),
              Text(
                'podipu',
                style: TStyles.h1(),
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
