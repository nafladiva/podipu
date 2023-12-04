import 'package:flutter/material.dart';
import 'package:podipu/shared/widgets/my_shimmer_loader.dart';

class JustListenLoader extends StatelessWidget {
  const JustListenLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyShimmerLoader(
          width: 110,
          height: 110,
          borderRadius: 8.0,
        ),
        SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyShimmerLoader(
                width: double.infinity,
                height: 14,
                borderRadius: 8.0,
              ),
              SizedBox(height: 6),
              MyShimmerLoader(
                width: double.infinity,
                height: 14,
                borderRadius: 8.0,
              ),
              SizedBox(height: 14),
              MyShimmerLoader(
                width: double.infinity,
                height: 10,
                borderRadius: 8.0,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
