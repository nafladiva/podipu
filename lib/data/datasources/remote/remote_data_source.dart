abstract class RemoteDataSources {
  Future<dynamic> getBestPodcasts();
  Future<dynamic> getCuratedPodcasts();
  Future<dynamic> getTrendingPodcasts();
  Future<dynamic> getPodcastDetail(String id);
  Future<dynamic> getEpisodeDetail(String id);
  Future<dynamic> getJustListenPodcast();
}

// class RemoteDataSourcesImpl implements RemoteDataSources {}
