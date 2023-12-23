import 'dart:convert';

import 'package:podipu/shared/consts/hive_key.dart';
import 'package:podipu/shared/consts/my_const.dart';
import 'package:podipu/shared/data/local_storage/hive_local_storage.dart';
import 'package:podipu/shared/data/models/genre_mdl.dart';
import 'package:podipu/shared/data/models/podcast_mdl.dart';
import 'package:podipu/shared/utils/http_util.dart';

abstract class GenreRepository {
  Future<List<GenreMdl>> getPodcastGenres();
  Future<List<PodcastMdl>> getPodcastsByGenre(GenreMdl genre);
  Future<List<GenreMdl>> searchGenre(String query);
}

class GenreRepositoryImpl implements GenreRepository {
  @override
  Future<List<GenreMdl>> getPodcastGenres() async {
    try {
      final res = await HttpUtil.get(
        url: '${MyConst.baseAPIUrl}/genres',
      );

      final decoded = json.decode(res.body)['genres'];

      // caching
      await HiveLocalStorage.set(
        boxName: HiveKey.cacheBoxKey,
        key: HiveKey.genresCacheKey,
        value: json.encode(decoded),
      );

      return List<GenreMdl>.from(decoded.map((x) => GenreMdl.fromMap(x)));
    } catch (_) {
      throw Exception();
    }
  }

  @override
  Future<List<PodcastMdl>> getPodcastsByGenre(GenreMdl genre) async {
    try {
      final res = await HttpUtil.get(
        url: '${MyConst.baseAPIUrl}/best_podcasts?genre_id=${genre.id}',
      );

      final decoded = json.decode(res.body)['podcasts'];

      // caching
      await HiveLocalStorage.set(
        boxName: HiveKey.cacheBoxKey,
        key: '${HiveKey.genresCacheKey}_${genre.id}',
        value: res.body,
      );

      return List<PodcastMdl>.from(decoded.map((x) => PodcastMdl.fromMap(x)));
    } catch (_) {
      throw Exception();
    }
  }

  @override
  Future<List<GenreMdl>> searchGenre(String query) async {
    try {
      final cachedGenres = await HiveLocalStorage.get(
        boxName: HiveKey.cacheBoxKey,
        key: HiveKey.genresCacheKey,
      );
      final decoded = json.decode(cachedGenres);
      final genreList = List<GenreMdl>.from(decoded.map(
        (x) => GenreMdl.fromMap(x),
      ));

      final result = genreList
          .where(
            (genre) => genre.name.toLowerCase().contains(query.toLowerCase()),
          )
          .toList();

      return result;
    } catch (_) {
      throw Exception();
    }
  }
}
