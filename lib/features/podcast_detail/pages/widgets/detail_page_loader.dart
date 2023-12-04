import 'package:flutter/material.dart';
import 'package:podipu/common/consts/size_const.dart';
import 'package:podipu/common/themes/text_styles.dart';
import 'package:podipu/shared/widgets/my_shimmer_loader.dart';

class DetailPageLoader extends StatelessWidget {
  const DetailPageLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(
        horizontal: SizeConst.kMarginX,
        vertical: SizeConst.kMarginY,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyShimmerLoader(
                width: 120,
                height: 120,
                borderRadius: 8,
              ),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyShimmerLoader(
                      width: double.infinity,
                      height: 14,
                      borderRadius: 8,
                    ),
                    SizedBox(height: 6.0),
                    MyShimmerLoader(
                      width: double.infinity,
                      height: 10,
                      borderRadius: 8,
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 24.0),
          Text(
            '🎯 ABOUT THIS PODCAST',
            style: TStyles.sh1(),
          ),
          const SizedBox(height: 12.0),
          ...List.generate(
            5,
            (_) => const Padding(
              padding: EdgeInsets.only(bottom: 6),
              child: MyShimmerLoader(
                width: double.infinity,
                height: 10,
                borderRadius: 8,
              ),
            ),
          ),
          const SizedBox(height: 12),
          const Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: [
              MyShimmerLoader(
                width: 70,
                height: 20,
                borderRadius: 20,
              ),
              MyShimmerLoader(
                width: 70,
                height: 20,
                borderRadius: 20,
              ),
              MyShimmerLoader(
                width: 70,
                height: 20,
                borderRadius: 20,
              ),
            ],
          ),
          const SizedBox(height: 12.0),
          const Divider(),
          const SizedBox(height: 12.0),
          Text(
            '🔥 LATEST EPISODE',
            style: TStyles.sh1(),
          ),
          const SizedBox(height: 12.0),
          const MyShimmerLoader(
            width: double.infinity,
            height: 120,
            borderRadius: 8,
          ),
          const SizedBox(height: 12.0),
          Text(
            '📒 PREVIOUS EPISODES',
            style: TStyles.sh1(),
          ),
          const SizedBox(height: 12.0),
          ...List.generate(
            3,
            (_) => const Padding(
              padding: EdgeInsets.only(bottom: 12),
              child: MyShimmerLoader(
                width: double.infinity,
                height: 120,
                borderRadius: 8,
              ),
            ),
          ),
          const SizedBox(height: 65.0),
        ],
      ),
    );
  }
}
