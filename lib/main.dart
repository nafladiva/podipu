import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'common/themes/themes.dart';

import 'features/home/home.dart';
import 'features/player/cubits/player/player_cubit.dart';
import 'injection.dart' as di;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => di.locator<PlayerCubit>(),
      child: MaterialApp(
        title: 'podipu',
        theme: Themes.init,
        home: const HomePage(),
      ),
    );
  }
}
