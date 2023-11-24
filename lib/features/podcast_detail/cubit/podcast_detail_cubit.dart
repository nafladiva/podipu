import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:podipu/features/podcast_detail/repositories/podcast_detail_repository.dart';
import 'package:podipu/shared/consts/hive_key.dart';
import 'package:podipu/shared/data/local_storage/hive_local_storage.dart';
import 'package:podipu/shared/data/models/podcast_mdl.dart';
import 'package:podipu/shared/states/view_states.dart';

part 'podcast_detail_state.dart';

class PodcastDetailCubit extends Cubit<PodcastDetailState> {
  final PodcastDetailRepository repository;

  PodcastDetailCubit({required this.repository})
      : super(
          const PodcastDetailState(
            podcastDetailLoadStatus: ViewState.initial(),
          ),
        );

  Future<void> onBuild({required String id}) async {
    emit(state.copyWith(podcastDetailLoadStatus: const ViewState.loading()));

    try {
      PodcastMdl? podcast;

      // check cache
      final cache = await HiveLocalStorage.get(
        boxName: HiveKey.cacheBoxKey,
        key: '${HiveKey.podcastDetailCacheKey}_$id',
      );

      if (cache != null) {
        final decoded = json.decode(cache);
        podcast = PodcastMdl.fromMap(decoded);
      } else {
        podcast = await repository.getPodcastDetail(id);
      }

      emit(
        state.copyWith(
          podcast: podcast,
          podcastDetailLoadStatus: const ViewState.success(),
        ),
      );
    } catch (e) {
      emit(state.copyWith(podcastDetailLoadStatus: const ViewState.failed()));
    }
  }
}
