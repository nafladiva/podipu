import 'dart:convert';

import 'package:podipu/shared/consts/hive_key.dart';
import 'package:podipu/shared/data/local_storage/hive_local_storage.dart';
import 'package:podipu/shared/data/models/episode_mdl.dart';
import 'package:podipu/shared/data/models/saved_mdl.dart';

abstract class SavedRepository {
  Future<List<SavedMdl>> getSavedList();
  Future<bool> checkEpisodeSavedStatus({required EpisodeMdl episode});
  Future<void> saveEpisode({required SavedMdl saved});
  Future<void> updateLatestTimestamp({
    required EpisodeMdl episode,
    required Duration? latestTimestamp,
  });
  Future<void> removeFromSaved({required EpisodeMdl episode});
}

class SavedRepositoryImpl implements SavedRepository {
  @override
  Future<List<SavedMdl>> getSavedList() async {
    try {
      final savedList = await HiveLocalStorage.get(
        boxName: HiveKey.savedEpisodeBoxKey,
      );

      if (savedList.isEmpty) return [];

      return List<SavedMdl>.from(
        savedList.map((x) => SavedMdl.fromMap(json.decode(x))),
      );
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<bool> checkEpisodeSavedStatus({required EpisodeMdl episode}) async {
    try {
      final result = await HiveLocalStorage.get(
        boxName: HiveKey.savedEpisodeBoxKey,
        key: episode.id,
      );

      if (result != null) return true;
      return false;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<void> saveEpisode({required SavedMdl saved}) async {
    try {
      await HiveLocalStorage.set(
        boxName: HiveKey.savedEpisodeBoxKey,
        key: saved.episode.id,
        value: json.encode(saved.toMap()),
      );
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<void> updateLatestTimestamp({
    required EpisodeMdl episode,
    required Duration? latestTimestamp,
  }) async {
    if (latestTimestamp != null) {
      try {
        final data = await HiveLocalStorage.get(
          boxName: HiveKey.savedEpisodeBoxKey,
          key: episode.id,
        );
        final saved = SavedMdl.fromMap(json.decode(data));
        final updated = saved.copyWith(latestTimestamp: latestTimestamp);

        await HiveLocalStorage.set(
          boxName: HiveKey.savedEpisodeBoxKey,
          key: episode.id,
          value: json.encode(updated.toMap()),
        );
      } catch (_) {
        throw Exception();
      }
    }
  }

  @override
  Future<void> removeFromSaved({required EpisodeMdl episode}) async {
    try {
      await HiveLocalStorage.remove(
        boxName: HiveKey.savedEpisodeBoxKey,
        key: episode.id,
      );
    } catch (e) {
      throw Exception();
    }
  }
}
