part of 'main_cubit.dart';

class MainState extends Equatable {
  final bool isShowSplash;
  final int currentIndex;
  final bool isShowPodcastDetail;

  const MainState({
    this.isShowSplash = true,
    this.currentIndex = 0,
    this.isShowPodcastDetail = false,
  });

  MainState copyWith({
    bool? isShowSplash,
    int? currentIndex,
    bool? isShowPodcastDetail,
  }) {
    return MainState(
      isShowSplash: isShowSplash ?? this.isShowSplash,
      currentIndex: currentIndex ?? this.currentIndex,
      isShowPodcastDetail: isShowPodcastDetail ?? this.isShowPodcastDetail,
    );
  }

  @override
  List<Object?> get props => [isShowSplash, currentIndex, isShowPodcastDetail];
}
