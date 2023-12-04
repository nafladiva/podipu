import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MyShimmerLoader extends StatelessWidget {
  const MyShimmerLoader({
    super.key,
    required this.width,
    required this.height,
    this.baseColor,
    this.highlightColor,
    this.borderRadius,
  });

  final double width;
  final double height;
  final Color? baseColor;
  final Color? highlightColor;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: baseColor ?? Colors.white.withOpacity(0.3),
      highlightColor: highlightColor ?? Colors.white.withOpacity(0.45),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(borderRadius ?? 8.0),
        ),
      ),
    );
  }
}
