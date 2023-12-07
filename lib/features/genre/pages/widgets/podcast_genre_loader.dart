import 'package:flutter/material.dart';
import 'package:podipu/shared/widgets/my_shimmer_loader.dart';

class PodcastGenreLoader extends StatelessWidget {
  const PodcastGenreLoader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        MyShimmerLoader(
          width: double.infinity,
          height: 80,
          borderRadius: 8.0,
        ),
        SizedBox(height: 12),
        MyShimmerLoader(
          width: double.infinity,
          height: 80,
          borderRadius: 8.0,
        ),
        SizedBox(height: 12),
        MyShimmerLoader(
          width: double.infinity,
          height: 80,
          borderRadius: 8.0,
        ),
      ],
    );
  }
}
