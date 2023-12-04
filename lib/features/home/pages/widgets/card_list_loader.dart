import 'package:flutter/material.dart';
import 'package:podipu/shared/widgets/my_shimmer_loader.dart';

class CardListLoader extends StatelessWidget {
  const CardListLoader({
    super.key,
    this.itemWidth,
  });

  final double? itemWidth;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CardItemLoader(width: itemWidth),
        const SizedBox(width: 12),
        CardItemLoader(width: itemWidth),
        const SizedBox(width: 12),
        CardItemLoader(width: itemWidth),
        const SizedBox(width: 12),
        CardItemLoader(width: itemWidth),
      ],
    );
  }
}

class CardItemLoader extends StatelessWidget {
  const CardItemLoader({
    super.key,
    this.width,
  });

  final double? width;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyShimmerLoader(
          width: width ?? 150.0,
          height: width ?? 150.0,
          borderRadius: 8.0,
        ),
        const SizedBox(height: 10),
        MyShimmerLoader(
          width: width ?? 150.0,
          height: 12.0,
          borderRadius: 8.0,
        ),
      ],
    );
  }
}
