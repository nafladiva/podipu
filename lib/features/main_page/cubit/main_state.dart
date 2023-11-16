part of 'main_cubit.dart';

class MainState extends Equatable {
  final int currentIndex;
  final bool isShowPodcastDetail;

  const MainState({
    this.currentIndex = 0,
    this.isShowPodcastDetail = false,
  });

  MainState copyWith({
    int? currentIndex,
    bool? isShowPodcastDetail,
  }) {
    return MainState(
      currentIndex: currentIndex ?? this.currentIndex,
      isShowPodcastDetail: isShowPodcastDetail ?? this.isShowPodcastDetail,
    );
  }

  @override
  List<Object?> get props => [currentIndex, isShowPodcastDetail];
}
