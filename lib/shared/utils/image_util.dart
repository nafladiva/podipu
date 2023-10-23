import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

class ImageUtil {
  static Future<Color> getDominantColor(String imagePath) async {
    final paletteGenerator = await PaletteGenerator.fromImageProvider(
      Image.asset(imagePath).image,
    );

    return paletteGenerator.dominantColor?.color ?? Colors.black;
  }
}
