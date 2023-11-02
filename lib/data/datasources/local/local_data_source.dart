abstract class LocalDataSource {
  Future<dynamic> savePodcast();
  Future<dynamic> getSavedPodcast();
  Future<dynamic> getRecentlyPlayed();
  Future<dynamic> cacheReponses();
  Future<dynamic> saveLastTimestamp(String id);
}

// class LocalDataSourceImpl implements LocalDataSource {}
