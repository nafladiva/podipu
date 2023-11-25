import 'dart:convert';

import 'package:podipu/shared/data/models/episode_mdl.dart';
import 'package:podipu/shared/data/models/podcast_mdl.dart';
import 'package:podipu/shared/consts/hive_key.dart';
import 'package:podipu/shared/consts/my_const.dart';
import 'package:podipu/shared/data/local_storage/hive_local_storage.dart';
import 'package:podipu/shared/data/models/recent_played_mdl.dart';
import 'package:podipu/shared/utils/http_util.dart';

abstract class HomeRepository {
  Future<List<PodcastMdl>> getBestPodcasts();
  Future<List<PodcastMdl>> getPodcastRecommendations(String podcastId);
  Future<List<EpisodeMdl>> getEpisodeRecommendations(String episodeId);
  Future<EpisodeMdl> getRandomPodcastEpisode();
  Future<List<RecentPlayedMdl>> getRecentPlayed();
}

class HomeRepositoryImpl implements HomeRepository {
  @override
  Future<List<PodcastMdl>> getBestPodcasts() async {
    try {
      final res = await HttpUtil.get(
        url: '${MyConst.baseAPIUrl}/best_podcasts',
      );

      final decoded = json.decode(res.body)['podcasts'];

      // caching
      await HiveLocalStorage.set(
        boxName: HiveKey.cacheBoxKey,
        key: HiveKey.bestPodcastCacheKey,
        value: json.encode(decoded),
      );

      return List<PodcastMdl>.from(decoded.map((x) => PodcastMdl.fromMap(x)));
    } catch (_) {
      throw Exception();
    }
  }

  @override
  Future<EpisodeMdl> getRandomPodcastEpisode() async {
    try {
      final res = await HttpUtil.get(
        url: '${MyConst.baseAPIUrl}/just_listen',
      );

      // caching
      await HiveLocalStorage.set(
        boxName: HiveKey.cacheBoxKey,
        key: HiveKey.randomEpisodeCacheKey,
        value: res.body,
      );

      final decoded = json.decode(res.body);
      return EpisodeMdl.fromMap(decoded);
    } catch (_) {
      throw Exception();
    }
  }

  @override
  Future<List<PodcastMdl>> getPodcastRecommendations(String podcastId) async {
    try {
      final res = await HttpUtil.get(
        url: '${MyConst.baseAPIUrl}/podcasts/$podcastId/recommendations',
      );

      final decoded = json.decode(res.body)['recommendations'];

      // caching
      await HiveLocalStorage.set(
        boxName: HiveKey.cacheBoxKey,
        key: HiveKey.podcastRecommendationCacheKey,
        value: json.encode(decoded),
      );

      return List<PodcastMdl>.from(decoded.map((x) => PodcastMdl.fromMap(x)));
    } catch (_) {
      throw Exception();
    }
  }

  @override
  Future<List<EpisodeMdl>> getEpisodeRecommendations(String episodeId) async {
    try {
      final res = await HttpUtil.get(
        url: '${MyConst.baseAPIUrl}/episodes/$episodeId/recommendations',
      );

      final decoded = json.decode(res.body)['recommendations'];

      // caching
      await HiveLocalStorage.set(
        boxName: HiveKey.cacheBoxKey,
        key: HiveKey.episodeRecommendationCacheKey,
        value: json.encode(decoded),
      );

      return List<EpisodeMdl>.from(decoded.map((x) => EpisodeMdl.fromMap(x)));
    } catch (_) {
      throw Exception();
    }
  }

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
}
