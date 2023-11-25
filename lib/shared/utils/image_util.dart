import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:podipu/common/themes/colors.dart';

class ImageUtil {
  static Future<Color> getDominantColor(String imagePath) async {
    final paletteGenerator = await PaletteGenerator.fromImageProvider(
      Image.network(imagePath).image,
    );

    return paletteGenerator.dominantColor?.color ?? MyColor.shadow;
  }
}
