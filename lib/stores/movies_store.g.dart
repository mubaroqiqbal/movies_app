// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MoviesStore on _MoviesStore, Store {
  late final _$getGenresAsyncAction =
      AsyncAction('_MoviesStore.getGenres', context: context);

  @override
  Future<bool> getGenres() {
    return _$getGenresAsyncAction.run(() => super.getGenres());
  }

  late final _$getMoviesAsyncAction =
      AsyncAction('_MoviesStore.getMovies', context: context);

  @override
  Future<GetMoviesResponses> getMovies(GetMoviesParams params) {
    return _$getMoviesAsyncAction.run(() => super.getMovies(params));
  }

  late final _$getMovieDetailAsyncAction =
      AsyncAction('_MoviesStore.getMovieDetail', context: context);

  @override
  Future<DetailMovieResponses> getMovieDetail(String movieId) {
    return _$getMovieDetailAsyncAction.run(() => super.getMovieDetail(movieId));
  }

  late final _$getMovieReviewsAsyncAction =
      AsyncAction('_MoviesStore.getMovieReviews', context: context);

  @override
  Future<GetMovieReviewsResponses> getMovieReviews(
      GetMovieReviewsParams params, String movieId) {
    return _$getMovieReviewsAsyncAction
        .run(() => super.getMovieReviews(params, movieId));
  }

  late final _$getMovieVideosAsyncAction =
      AsyncAction('_MoviesStore.getMovieVideos', context: context);

  @override
  Future<GetMovieVideosResponses> getMovieVideos(String movieId) {
    return _$getMovieVideosAsyncAction.run(() => super.getMovieVideos(movieId));
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
