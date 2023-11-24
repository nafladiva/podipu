import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:podipu/data/models/episode_mdl.dart';
import 'package:podipu/data/models/podcast_mdl.dart';
import 'package:podipu/features/home/repositories/home_repository.dart';
import 'package:podipu/shared/consts/hive_key.dart';
import 'package:podipu/shared/data/local_storage/hive_local_storage.dart';
import 'package:podipu/shared/states/view_states.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepository repository;

  HomeCubit({required this.repository})
      : super(
          const HomeState(
            bestPodcastLoadStatus: ViewState.initial(),
            podcastRecommendationLoadStatus: ViewState.initial(),
            episodeRecommendationLoadStatus: ViewState.initial(),
            randomEpisodeLoadStatus: ViewState.initial(),
          ),
        );

  Future<void> onBuild() async {
    // getBestPodcast(), emit to state
    await getBestPodcast();
    await getRandomEpisode();

    // pick one random podcast (from bestPodcastList), then it will be id for getPodcastRecommendation
    // selected podcast will be emit to selectedPodcast state

    // getPodcastRecommendation()

    // getRandomPodcast()
  }

  Future<void> getBestPodcast() async {
    emit(state.copyWith(bestPodcastLoadStatus: const ViewState.loading()));

    try {
      List<PodcastMdl>? podcastList;

      // caching
      final cache = await HiveLocalStorage.get(
        boxName: HiveKey.cacheBoxKey,
        key: HiveKey.bestPodcastCacheKey,
      );

      if (cache != null) {
        final decoded = json.decode(cache);
        podcastList =
            List<PodcastMdl>.from(decoded.map((x) => PodcastMdl.fromMap(x)));
      } else {
        podcastList = await repository.getBestPodcasts();
      }

      emit(
        state.copyWith(
          bestPodcastList: podcastList,
          bestPodcastLoadStatus: const ViewState.success(),
        ),
      );
    } catch (e) {
      emit(state.copyWith(bestPodcastLoadStatus: const ViewState.failed()));
    }
  }

  Future<void> getPodcastRecommendation() async {}

  Future<void> getRandomEpisode() async {
    emit(state.copyWith(randomEpisodeLoadStatus: const ViewState.loading()));

    try {
      EpisodeMdl? episode;

      // caching
      final cache = await HiveLocalStorage.get(
        boxName: HiveKey.cacheBoxKey,
        key: HiveKey.randomEpisodeCacheKey,
      );

      if (cache != null) {
        final decoded = json.decode(cache);
        episode = EpisodeMdl.fromMap(decoded);
      } else {
        episode = await repository.getRandomPodcastEpisode();
      }

      emit(
        state.copyWith(
          randomEpisode: episode,
          randomEpisodeLoadStatus: const ViewState.success(),
        ),
      );
    } catch (e) {
      emit(state.copyWith(randomEpisodeLoadStatus: const ViewState.failed()));
    }
  }
}
