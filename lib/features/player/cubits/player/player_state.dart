part of 'player_cubit.dart';

class PlayerState extends Equatable {
  final Color backgroundColor;

  const PlayerState({
    this.backgroundColor = MyColor.background,
  });

  PlayerState copyWith({
    Color? backgroundColor,
  }) {
    return PlayerState(
      backgroundColor: backgroundColor ?? this.backgroundColor,
    );
  }

  @override
  List<Object?> get props => [backgroundColor];
}
