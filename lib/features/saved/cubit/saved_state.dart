part of 'saved_cubit.dart';

class SavedState extends Equatable {
  final ViewState loadStatus;
  final List<SavedMdl> savedList;

  const SavedState({
    required this.loadStatus,
    this.savedList = const [],
  });

  SavedState copyWith({
    ViewState? loadStatus,
    List<SavedMdl>? savedList,
  }) {
    return SavedState(
      loadStatus: loadStatus ?? this.loadStatus,
      savedList: savedList ?? this.savedList,
    );
  }

  @override
  List<Object?> get props => [loadStatus, savedList];
}
