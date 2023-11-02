import 'package:get_it/get_it.dart';
import 'package:just_audio/just_audio.dart';

import 'features/player/cubits/player/podcast_player_cubit.dart';

final locator = GetIt.instance;

void init() {
  locator.registerFactory(
    () => PodcastPlayerCubit(),
  );

  locator.registerSingleton(AudioPlayer());
}
