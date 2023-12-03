import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(const MainState());

  void onBuild() {
    Future.delayed(
      const Duration(seconds: 2),
      () => emit(state.copyWith(isShowSplash: false)),
    );
  }

  void onChangeIndex(int index) {
    if (index == 0) {
      emit(state.copyWith(isShowPodcastDetail: false));
    }
    emit(state.copyWith(currentIndex: index));
  }

  void showPodcastDetail(bool isShow) {
    emit(state.copyWith(isShowPodcastDetail: isShow));
  }
}
