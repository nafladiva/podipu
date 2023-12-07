import 'package:get_it/get_it.dart';
import 'package:just_audio/just_audio.dart';

import 'features/genre/cubit/genre_cubit.dart';
import 'features/genre/repositories/genre_repository.dart';
import 'features/main_page/cubit/main_cubit.dart';
import 'features/player/cubits/player/podcast_player_cubit.dart';
import 'features/recent_played/cubit/recent_played_cubit.dart';
import 'features/recent_played/repositories/recent_played_repository.dart';
import 'features/saved/cubit/saved_cubit.dart';
import 'features/saved/repositories/saved_repository.dart';

final locator = GetIt.instance;

void init() {
  locator.registerFactory(
    () => MainCubit(),
  );
  locator.registerFactory(
    () => PodcastPlayerCubit(),
  );
  locator.registerFactory(
    () => RecentPlayedCubit(
      repository: locator(),
    ),
  );
  locator.registerFactory(
    () => SavedCubit(
      repository: locator(),
    ),
  );
  locator.registerFactory(
    () => GenreCubit(
      repository: locator(),
    ),
  );

  locator.registerSingleton(AudioPlayer());

  locator.registerLazySingleton<RecentPlayedRepository>(
    () => RecentPlayedRepositoryImpl(),
  );
  locator.registerLazySingleton<SavedRepository>(
    () => SavedRepositoryImpl(),
  );
  locator.registerLazySingleton<GenreRepository>(
    () => GenreRepositoryImpl(),
  );
}
