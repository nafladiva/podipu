import 'package:get_it/get_it.dart';
import 'package:just_audio/just_audio.dart';

import 'features/player/cubits/player/player_cubit.dart';

final locator = GetIt.instance;

void init() {
  locator.registerFactory(
    () => PlayerCubit(),
  );

  locator.registerSingleton(AudioPlayer());
}
