import 'package:flutter/material.dart';
import 'package:podipu/shared/widgets/my_shimmer_loader.dart';

class GenreListLoader extends StatelessWidget {
  const GenreListLoader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Wrap(
      spacing: 10,
      children: [
        MyShimmerLoader(
          width: 55,
          height: 15,
          borderRadius: 20,
        ),
        MyShimmerLoader(
          width: 55,
          height: 15,
          borderRadius: 20,
        ),
        MyShimmerLoader(
          width: 55,
          height: 15,
          borderRadius: 20,
        ),
      ],
    );
  }
}
