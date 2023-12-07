import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'common/themes/themes.dart';

import 'features/genre/cubit/genre_cubit.dart';
import 'features/main_page/cubit/main_cubit.dart';
import 'features/player/cubits/player/podcast_player_cubit.dart';
import 'features/recent_played/cubit/recent_played_cubit.dart';
import 'features/saved/cubit/saved_cubit.dart';
import 'features/splash/splash.dart';
import 'injection.dart' as di;
import 'shared/data/local_storage/hive_local_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveLocalStorage.init();
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => di.locator<PodcastPlayerCubit>(),
        ),
        BlocProvider(
          create: (_) => di.locator<MainCubit>()..onBuild(),
        ),
        BlocProvider(
          create: (_) => di.locator<RecentPlayedCubit>()..onBuild(),
        ),
        BlocProvider(
          create: (_) => di.locator<SavedCubit>()..onBuild(),
        ),
        BlocProvider(
          create: (_) => di.locator<GenreCubit>()..onBuild(),
        ),
      ],
      child: MaterialApp(
        title: 'podipu',
        theme: Themes.init,
        home: const SplashPage(),
      ),
    );
  }
}
