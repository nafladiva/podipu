part of 'genre_cubit.dart';

class GenreState extends Equatable {
  final ViewState genreListloadStatus;
  final ViewState podcastByGenreLoadStatus;
  final List<GenreMdl> genreList;
  final List<PodcastMdl>? podcastListByGenre;

  const GenreState({
    required this.genreListloadStatus,
    required this.podcastByGenreLoadStatus,
    this.genreList = const [],
    this.podcastListByGenre,
  });

  GenreState copyWith({
    ViewState? genreListloadStatus,
    ViewState? podcastByGenreLoadStatus,
    List<GenreMdl>? genreList,
    List<PodcastMdl>? podcastListByGenre,
  }) {
    return GenreState(
      genreListloadStatus: genreListloadStatus ?? this.genreListloadStatus,
      podcastByGenreLoadStatus:
          podcastByGenreLoadStatus ?? this.podcastByGenreLoadStatus,
      genreList: genreList ?? this.genreList,
      podcastListByGenre: podcastListByGenre ?? this.podcastListByGenre,
    );
  }

  @override
  List<Object?> get props => [
        genreListloadStatus,
        podcastByGenreLoadStatus,
        genreList,
        podcastListByGenre,
      ];
}
