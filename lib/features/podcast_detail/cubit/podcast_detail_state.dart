part of 'podcast_detail_cubit.dart';

class PodcastDetailState extends Equatable {
  final ViewState podcastDetailLoadStatus;
  final PodcastMdl? podcast;

  const PodcastDetailState({
    required this.podcastDetailLoadStatus,
    this.podcast,
  });

  PodcastDetailState copyWith({
    ViewState? podcastDetailLoadStatus,
    PodcastMdl? podcast,
  }) {
    return PodcastDetailState(
      podcastDetailLoadStatus:
          podcastDetailLoadStatus ?? this.podcastDetailLoadStatus,
      podcast: podcast ?? this.podcast,
    );
  }

  @override
  List<Object?> get props => [podcastDetailLoadStatus, podcast];
}
