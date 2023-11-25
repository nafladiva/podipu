part of 'podcast_player_cubit.dart';

class PodcastPlayerState extends Equatable {
  final EpisodeMdl? episode;
  final Color backgroundColor;
  final bool isPlaying;

  const PodcastPlayerState({
    this.episode,
    this.backgroundColor = MyColor.background,
    this.isPlaying = false,
  });

  bool get isAudioExist => episode != null;

  PodcastPlayerState copyWith({
    EpisodeMdl? episode,
    Color? backgroundColor,
    bool? isPlaying,
  }) {
    return PodcastPlayerState(
      episode: episode ?? this.episode,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      isPlaying: isPlaying ?? this.isPlaying,
    );
  }

  @override
  List<Object?> get props => [
        episode,
        backgroundColor,
        isPlaying,
      ];
}
