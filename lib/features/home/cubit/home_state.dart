part of 'home_cubit.dart';

class HomeState extends Equatable {
  final ViewState bestPodcastLoadStatus;
  final ViewState podcastRecommendationLoadStatus;
  final ViewState episodeRecommendationLoadStatus;
  final ViewState randomEpisodeLoadStatus;
  final List<PodcastMdl> bestPodcastList;
  final List<PodcastMdl> podcastRecommendationList;
  final List<EpisodeMdl> episodeRecommendationList;
  final EpisodeMdl? randomEpisode;
  final PodcastMdl? selectedPodcast;

  const HomeState({
    required this.bestPodcastLoadStatus,
    required this.podcastRecommendationLoadStatus,
    required this.episodeRecommendationLoadStatus,
    required this.randomEpisodeLoadStatus,
    this.bestPodcastList = const [],
    this.podcastRecommendationList = const [],
    this.episodeRecommendationList = const [],
    this.randomEpisode,
    this.selectedPodcast,
  });

  HomeState copyWith({
    ViewState? bestPodcastLoadStatus,
    ViewState? podcastRecommendationLoadStatus,
    ViewState? episodeRecommendationLoadStatus,
    ViewState? randomEpisodeLoadStatus,
    List<PodcastMdl>? bestPodcastList,
    List<PodcastMdl>? podcastRecommendationList,
    List<EpisodeMdl>? episodeRecommendationList,
    EpisodeMdl? randomEpisode,
    PodcastMdl? selectedPodcast,
  }) {
    return HomeState(
      bestPodcastLoadStatus:
          bestPodcastLoadStatus ?? this.bestPodcastLoadStatus,
      podcastRecommendationLoadStatus: podcastRecommendationLoadStatus ??
          this.podcastRecommendationLoadStatus,
      episodeRecommendationLoadStatus: episodeRecommendationLoadStatus ??
          this.episodeRecommendationLoadStatus,
      randomEpisodeLoadStatus:
          randomEpisodeLoadStatus ?? this.randomEpisodeLoadStatus,
      bestPodcastList: bestPodcastList ?? this.bestPodcastList,
      podcastRecommendationList:
          podcastRecommendationList ?? this.podcastRecommendationList,
      episodeRecommendationList:
          episodeRecommendationList ?? this.episodeRecommendationList,
      randomEpisode: randomEpisode ?? this.randomEpisode,
      selectedPodcast: selectedPodcast ?? this.selectedPodcast,
    );
  }

  @override
  List<Object?> get props => [
        bestPodcastLoadStatus,
        podcastRecommendationLoadStatus,
        episodeRecommendationLoadStatus,
        randomEpisodeLoadStatus,
        bestPodcastList,
        podcastRecommendationList,
        episodeRecommendationList,
        randomEpisode,
        selectedPodcast,
      ];
}
