import 'dart:convert';

import 'package:podipu/shared/consts/hive_key.dart';
import 'package:podipu/shared/data/local_storage/hive_local_storage.dart';
import 'package:podipu/shared/data/models/episode_mdl.dart';
import 'package:podipu/shared/data/models/recent_played_mdl.dart';

abstract class RecentPlayedRepository {
  Future<List<RecentPlayedMdl>> getRecentPlayed();
  Future<void> setAudioToRecentPlayed({
    required EpisodeMdl episode,
    Duration? latestTimestamp,
  });
  Future<void> removeFromRecentPlayed({
    required EpisodeMdl episode,
  });
}

class RecentPlayedRepositoryImpl implements RecentPlayedRepository {
  @override
  Future<List<RecentPlayedMdl>> getRecentPlayed() async {
    try {
      final recentList = await HiveLocalStorage.get(
        boxName: HiveKey.recentPlayedBoxKey,
      );

      if (recentList.isEmpty) return [];

      return List<RecentPlayedMdl>.from(
        recentList.map((x) => RecentPlayedMdl.fromMap(json.decode(x))),
      );
    } catch (_) {
      throw Exception();
    }
  }

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

  @override
  Future<void> removeFromRecentPlayed({
    required EpisodeMdl episode,
  }) async {
    try {
      await HiveLocalStorage.remove(
        boxName: HiveKey.recentPlayedBoxKey,
        key: episode.id,
      );
    } catch (_) {
      throw Exception();
    }
  }
}
