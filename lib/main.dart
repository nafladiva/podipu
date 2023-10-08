import 'package:flutter/material.dart';
import 'common/themes/themes.dart';

import 'features/home/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'podipu',
      theme: Themes.init,
      home: const HomePage(),
    );
  }
}
