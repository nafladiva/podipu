import 'dart:convert';

import 'package:podipu/shared/consts/hive_key.dart';
import 'package:podipu/shared/data/local_storage/hive_local_storage.dart';
import 'package:podipu/shared/data/models/episode_mdl.dart';
import 'package:podipu/shared/data/models/recent_played_mdl.dart';

abstract class PlayerRepository {
  Future<void> setAudioToRecentPlayed({
    required EpisodeMdl episode,
    Duration? latestTimestamp,
  });
}

class PlayerRepositoryImpl implements PlayerRepository {
  @override
  Future<void> setAudioToRecentPlayed({
    required EpisodeMdl episode,
    Duration? latestTimestamp,
  }) async {
    try {
      final recentEpisode = RecentPlayedMdl(
        episode: episode,
        playedAt: DateTime.now(),
        latestTimestamp: latestTimestamp,
      );

      await HiveLocalStorage.set(
        boxName: HiveKey.recentPlayedBoxKey,
        key: episode.id,
        value: json.encode(recentEpisode.toMap()),
      );
    } catch (_) {
      throw Exception();
    }
  }
}
