import 'dart:convert';

import 'package:podipu/shared/consts/hive_key.dart';
import 'package:podipu/shared/consts/my_const.dart';
import 'package:podipu/shared/data/local_storage/hive_local_storage.dart';
import 'package:podipu/shared/data/models/podcast_mdl.dart';
import 'package:podipu/shared/utils/http_util.dart';

abstract class PodcastDetailRepository {
  Future<PodcastMdl> getPodcastDetail(String id);
}

class PodcastDetailRepositoryImpl implements PodcastDetailRepository {
  @override
  Future<PodcastMdl> getPodcastDetail(String id) async {
    try {
      final res = await HttpUtil.get(
        url: '${MyConst.baseAPIUrl}/podcasts/$id',
      );

      // caching
      await HiveLocalStorage.set(
        boxName: HiveKey.cacheBoxKey,
        key: '${HiveKey.podcastDetailCacheKey}_$id',
        value: res.body,
      );

      final decoded = json.decode(res.body);
      return PodcastMdl.fromMap(decoded);
    } catch (_) {
      throw Exception();
    }
  }
}
