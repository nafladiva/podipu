import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:podipu/shared/data/models/episode_mdl.dart';
import 'package:podipu/shared/data/models/saved_mdl.dart';
import 'package:podipu/shared/states/view_states.dart';

import '../repositories/saved_repository.dart';

part 'saved_state.dart';

class SavedCubit extends Cubit<SavedState> {
  final SavedRepository repository;

  SavedCubit({required this.repository})
      : super(const SavedState(loadStatus: ViewState.initial()));

  Future<void> onBuild() async {
    await getSavedList();
  }

  Future<void> getSavedList() async {
    emit(state.copyWith(loadStatus: const ViewState.loading()));

    try {
      final savedList = await repository.getSavedList();

      emit(
        state.copyWith(
          savedList: savedList,
          loadStatus: const ViewState.success(),
        ),
      );
    } catch (e) {
      emit(state.copyWith(loadStatus: const ViewState.failed()));
    }
  }

  Future<bool> checkEpisodeSavedStatus({required EpisodeMdl episode}) async {
    try {
      final isSaved = await repository.checkEpisodeSavedStatus(
        episode: episode,
      );
      return isSaved;
    } catch (e) {
      return false;
    }
  }

  Future<void> saveEpisode({
    required EpisodeMdl episode,
    Duration? latestTimestamp,
  }) async {
    try {
      final saved = SavedMdl(
        episode: episode,
        latestTimestamp: latestTimestamp,
      );

      await repository.saveEpisode(saved: saved);
      await getSavedList();
    } catch (e) {
      throw Exception();
    }
  }

  Future<void> removeFromSaved({
    required EpisodeMdl episode,
  }) async {
    try {
      await repository.removeFromSaved(episode: episode);
      await getSavedList();
    } catch (e) {
      throw Exception();
    }
  }
}
