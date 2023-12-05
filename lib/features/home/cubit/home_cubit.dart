import 'dart:convert';
import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:podipu/shared/data/models/episode_mdl.dart';
import 'package:podipu/shared/data/models/podcast_mdl.dart';
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
    await getBestPodcast();
    await getRandomEpisode();
    await getPodcastRecommendation();
  }

  Future<void> getBestPodcast() async {
    emit(state.copyWith(bestPodcastLoadStatus: const ViewState.loading()));

    try {
      List<PodcastMdl>? podcastList;

      // check cache
      final cache = await HiveLocalStorage.get(
        boxName: HiveKey.cacheBoxKey,
        key: HiveKey.bestPodcastCacheKey,
      );

      if (cache != null) {
        final decoded = json.decode(cache);
        podcastList =
            List<PodcastMdl>.from(decoded.map((x) => PodcastMdl.fromMap(x)));
      } else {
        // make an API request
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

  Future<void> getRandomEpisode() async {
    emit(state.copyWith(randomEpisodeLoadStatus: const ViewState.loading()));

    try {
      EpisodeMdl? episode;

      // check cache
      final cache = await HiveLocalStorage.get(
        boxName: HiveKey.cacheBoxKey,
        key: HiveKey.randomEpisodeCacheKey,
      );

      if (cache != null) {
        final decoded = json.decode(cache);
        episode = EpisodeMdl.fromMap(decoded);
      } else {
        // make an API request
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

  Future<void> getPodcastRecommendation() async {
    emit(state.copyWith(
      podcastRecommendationLoadStatus: const ViewState.loading(),
    ));

    try {
      List<PodcastMdl>? podcastList;

      // check cache
      final recommendationListCache = await HiveLocalStorage.get(
        boxName: HiveKey.cacheBoxKey,
        key: HiveKey.podcastRecommendationCacheKey,
      );
      final selectedPodcastCache = await HiveLocalStorage.get(
        boxName: HiveKey.cacheBoxKey,
        key: HiveKey.selectedPodcastRecomCacheKey,
      );

      if (recommendationListCache != null && selectedPodcastCache != null) {
        // podcast recommendation list
        final decoded = json.decode(recommendationListCache);
        podcastList = List<PodcastMdl>.from(
          decoded.map((x) => PodcastMdl.fromMap(x)),
        );

        // selected podcast for recommendation
        final selectedPodcastDecoded = json.decode(selectedPodcastCache);
        final selectedPodcast = PodcastMdl.fromMap(selectedPodcastDecoded);
        emit(state.copyWith(
          selectedPodcastForRecommendation: selectedPodcast,
        ));
      } else {
        // make an API request, based by one podcast from best podcast list
        final randomIndex = Random().nextInt(state.bestPodcastList.length);
        final recommendationPodcast = state.bestPodcastList[randomIndex];

        podcastList = await repository.getPodcastRecommendations(
          recommendationPodcast.id,
        );

        // caching
        await HiveLocalStorage.set(
          boxName: HiveKey.cacheBoxKey,
          key: HiveKey.selectedPodcastRecomCacheKey,
          value: json.encode(recommendationPodcast.toMap()),
        );

        emit(state.copyWith(
          selectedPodcastForRecommendation: recommendationPodcast,
        ));
      }

      emit(
        state.copyWith(
          podcastRecommendationList: podcastList,
          podcastRecommendationLoadStatus: const ViewState.success(),
        ),
      );
    } catch (e) {
      emit(state.copyWith(
        podcastRecommendationLoadStatus: const ViewState.failed(),
      ));
    }
  }
}
