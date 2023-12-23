import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:podipu/features/genre/repositories/genre_repository.dart';
import 'package:podipu/shared/consts/hive_key.dart';
import 'package:podipu/shared/data/local_storage/hive_local_storage.dart';
import 'package:podipu/shared/data/models/genre_mdl.dart';
import 'package:podipu/shared/data/models/podcast_mdl.dart';
import 'package:podipu/shared/states/view_states.dart';

part 'genre_state.dart';

class GenreCubit extends Cubit<GenreState> {
  final GenreRepository repository;

  GenreCubit({required this.repository})
      : super(const GenreState(
          genreListloadStatus: ViewState.initial(),
          podcastByGenreLoadStatus: ViewState.initial(),
        ));

  Future<void> onBuild() async {
    emit(state.copyWith(genreListloadStatus: const ViewState.loading()));

    try {
      List<GenreMdl>? genreList;

      // check cache
      final cache = await HiveLocalStorage.get(
        boxName: HiveKey.cacheBoxKey,
        key: HiveKey.genresCacheKey,
      );

      if (cache != null) {
        final decoded = json.decode(cache);
        genreList = List<GenreMdl>.from(decoded.map(
          (x) => GenreMdl.fromMap(x),
        ));
      } else {
        // make an API request
        genreList = await repository.getPodcastGenres();
      }

      final randomGenres = (genreList..shuffle()).take(5).toList();

      emit(
        state.copyWith(
          genreList: randomGenres,
          genreListloadStatus: const ViewState.success(),
        ),
      );
    } catch (e) {
      emit(state.copyWith(genreListloadStatus: const ViewState.failed()));
    }
  }

  Future<void> getPodcastsByGenre(GenreMdl genre) async {
    emit(state.copyWith(podcastByGenreLoadStatus: const ViewState.loading()));

    try {
      List<PodcastMdl>? podcastList;

      // check cache
      final cache = await HiveLocalStorage.get(
        boxName: HiveKey.cacheBoxKey,
        key: '${HiveKey.genresCacheKey}_${genre.id}',
      );

      if (cache != null) {
        final decoded = json.decode(cache)['podcasts'];
        podcastList = List<PodcastMdl>.from(decoded.map(
          (x) => PodcastMdl.fromMap(x),
        ));
      } else {
        // make an API request
        podcastList = await repository.getPodcastsByGenre(genre);
      }

      emit(
        state.copyWith(
          podcastListByGenre: podcastList,
          podcastByGenreLoadStatus: const ViewState.success(),
        ),
      );
    } catch (e) {
      emit(state.copyWith(podcastByGenreLoadStatus: const ViewState.failed()));
    }
  }

  Future<List<GenreMdl>> search(String query) async {
    return await repository.searchGenre(query);
  }
}
