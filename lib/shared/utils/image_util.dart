import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:podipu/common/themes/colors.dart';
import 'package:podipu/shared/widgets/my_shimmer_loader.dart';

class ImageUtil {
  static Future<Color> getDominantColor(String imagePath) async {
    final paletteGenerator = await PaletteGenerator.fromImageProvider(
      Image.network(imagePath).image,
    );

    return paletteGenerator.dominantColor?.color ?? MyColor.shadow;
  }

  static Widget buildCachedNetworkImage({
    required String url,
    required double width,
    double? height,
  }) {
    return CachedNetworkImage(
      imageUrl: url,
      placeholder: (_, __) => MyShimmerLoader(
        width: width,
        height: height ?? width,
      ),
      errorWidget: (_, __, ___) => const Icon(Icons.error),
      width: width,
      height: height ?? width,
    );
  }
}
