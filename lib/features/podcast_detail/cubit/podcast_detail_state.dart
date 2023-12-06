part of 'podcast_detail_cubit.dart';

class PodcastDetailState extends Equatable {
  final ViewState podcastDetailLoadStatus;
  final PodcastMdl? podcast;
  final List<String> savedEpisodeIdList;

  const PodcastDetailState({
    required this.podcastDetailLoadStatus,
    this.podcast,
    this.savedEpisodeIdList = const [],
  });

  EpisodeMdl get latestEpisode => podcast!.episodes!.first;
  bool isEpisodeSaved(String id) => savedEpisodeIdList.contains(id);

  PodcastDetailState copyWith({
    ViewState? podcastDetailLoadStatus,
    PodcastMdl? podcast,
    List<String>? savedEpisodeIdList,
  }) {
    return PodcastDetailState(
      podcastDetailLoadStatus:
          podcastDetailLoadStatus ?? this.podcastDetailLoadStatus,
      podcast: podcast ?? this.podcast,
      savedEpisodeIdList: savedEpisodeIdList ?? this.savedEpisodeIdList,
    );
  }

  @override
  List<Object?> get props => [
        podcastDetailLoadStatus,
        podcast,
        savedEpisodeIdList,
      ];
}
