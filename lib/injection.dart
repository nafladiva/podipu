import 'package:get_it/get_it.dart';
import 'package:just_audio/just_audio.dart';
import 'package:podipu/features/player/repositories/player_repository.dart';

import 'features/home/cubit/home_cubit.dart';
import 'features/home/repositories/home_repository.dart';
import 'features/main_page/cubit/main_cubit.dart';
import 'features/player/cubits/player/podcast_player_cubit.dart';

final locator = GetIt.instance;

void init() {
  locator.registerFactory(
    () => MainCubit(),
  );
  locator.registerFactory(
    () => HomeCubit(repository: locator()),
  );
  locator.registerFactory(
    () => PodcastPlayerCubit(
      repository: locator(),
      homeCubit: locator(),
    ),
  );

  locator.registerSingleton(AudioPlayer());

  locator.registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl());
  locator.registerLazySingleton<PlayerRepository>(() => PlayerRepositoryImpl());
}
