import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:podipu/features/recent_played/repositories/recent_played_repository.dart';
import 'package:podipu/shared/data/models/episode_mdl.dart';
import 'package:podipu/shared/data/models/recent_played_mdl.dart';
import 'package:podipu/shared/states/view_states.dart';

part 'recent_played_state.dart';

class RecentPlayedCubit extends Cubit<RecentPlayedState> {
  final RecentPlayedRepository repository;

  RecentPlayedCubit({required this.repository})
      : super(const RecentPlayedState(loadStatus: ViewState.initial()));

  Future<void> onBuild() async {
    await getRecentPlayed();
  }

  Future<void> getRecentPlayed() async {
    emit(state.copyWith(loadStatus: const ViewState.loading()));

    try {
      final recentList = await repository.getRecentPlayed();
      final sortedByDate = recentList
        ..sort((a, b) => b.playedAt.compareTo(a.playedAt));

      emit(
        state.copyWith(
          recentList: sortedByDate,
          loadStatus: const ViewState.success(),
        ),
      );
    } catch (e) {
      emit(state.copyWith(loadStatus: const ViewState.failed()));
    }
  }

  Future<void> setToRecentPlayed({
    required EpisodeMdl episode,
    Duration? latestTimestamp,
  }) async {
    try {
      await repository.setAudioToRecentPlayed(
        episode: episode,
        latestTimestamp: latestTimestamp,
      );

      // rebuild RRecentPlayedView
      await getRecentPlayed();
    } catch (_) {}
  }
}
