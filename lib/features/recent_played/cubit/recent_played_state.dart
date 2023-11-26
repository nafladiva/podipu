part of 'recent_played_cubit.dart';

class RecentPlayedState extends Equatable {
  final ViewState loadStatus;
  final List<RecentPlayedMdl> recentList;

  const RecentPlayedState({
    required this.loadStatus,
    this.recentList = const [],
  });

  RecentPlayedState copyWith({
    ViewState? loadStatus,
    List<RecentPlayedMdl>? recentList,
  }) {
    return RecentPlayedState(
      loadStatus: loadStatus ?? this.loadStatus,
      recentList: recentList ?? this.recentList,
    );
  }

  @override
  List<Object?> get props => [loadStatus, recentList];
}
