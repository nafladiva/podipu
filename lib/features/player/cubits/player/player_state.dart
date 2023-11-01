part of 'player_cubit.dart';

class PlayerState extends Equatable {
  final Podcast? podcast;
  final Color backgroundColor;
  final bool isPlaying;

  const PlayerState({
    this.podcast,
    this.backgroundColor = MyColor.background,
    this.isPlaying = false,
  });

  bool get isAudioExist => podcast != null;

  PlayerState copyWith({
    Podcast? podcast,
    Color? backgroundColor,
    bool? isPlaying,
  }) {
    return PlayerState(
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
