part of 'podcast_player_cubit.dart';

class PodcastPlayerState extends Equatable {
  final ViewState loadStatus;
  final EpisodeMdl? episode;
  final Color backgroundColor;
  final bool isPlaying;
  final bool isSaved;

  const PodcastPlayerState({
    required this.loadStatus,
    this.episode,
    this.backgroundColor = MyColor.background,
    this.isPlaying = false,
    this.isSaved = false,
  });

  bool get isAudioExist => episode != null;

  PodcastPlayerState copyWith({
    ViewState? loadStatus,
    EpisodeMdl? episode,
    Color? backgroundColor,
    bool? isPlaying,
    bool? isSaved,
  }) {
    return PodcastPlayerState(
      loadStatus: loadStatus ?? this.loadStatus,
      episode: episode ?? this.episode,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      isPlaying: isPlaying ?? this.isPlaying,
      isSaved: isSaved ?? this.isSaved,
    );
  }

  @override
  List<Object?> get props => [
        loadStatus,
        episode,
        backgroundColor,
        isPlaying,
        isSaved,
      ];
}
