import 'package:equatable/equatable.dart';

enum StatusState { initial, loading, success, failed }

class ViewState<T> extends Equatable {
  final StatusState state;
  final T? data;
  final String? errorMessage;

  const ViewState.initial()
      : state = StatusState.initial,
        data = null,
        errorMessage = null;

  const ViewState.loading()
      : state = StatusState.loading,
        data = null,
        errorMessage = null;

  const ViewState.success({this.data})
      : state = StatusState.success,
        errorMessage = null;

  const ViewState.failed({
    this.errorMessage,
  })  : state = StatusState.failed,
        data = null;

  bool get isLoading => state == StatusState.loading;
  bool get isSuccess => state == StatusState.success;
  bool get isFailed => state == StatusState.failed;

  @override
  List<Object?> get props => [state, data, errorMessage];
}
