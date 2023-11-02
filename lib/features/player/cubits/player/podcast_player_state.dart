part of 'podcast_player_cubit.dart';

class PodcastPlayerState extends Equatable {
  final Podcast? podcast;
  final Color backgroundColor;
  final bool isPlaying;

  const PodcastPlayerState({
    this.podcast,
    this.backgroundColor = MyColor.background,
    this.isPlaying = false,
  });

  bool get isAudioExist => podcast != null;

  PodcastPlayerState copyWith({
    Podcast? podcast,
    Color? backgroundColor,
    bool? isPlaying,
  }) {
    return PodcastPlayerState(
      podcast: podcast ?? this.podcast,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      isPlaying: isPlaying ?? this.isPlaying,
    );
  }

  @override
  List<Object?> get props => [
        podcast,
        backgroundColor,
        isPlaying,
      ];
}
