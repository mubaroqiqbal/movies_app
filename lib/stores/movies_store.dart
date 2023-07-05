import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
import 'package:movies_app/data/network/movies_api.dart';
import 'package:movies_app/data/repository/movies_repository.dart';
import 'package:movies_app/models/params/get_movie_reviews_params.dart';
import 'package:movies_app/models/params/get_movies_params.dart';
import 'package:movies_app/models/responses/detail_movie_responses.dart';
import 'package:movies_app/models/responses/get_genres_responses.dart';
import 'package:movies_app/models/responses/get_movie_reviews_responses.dart';
import 'package:movies_app/models/responses/get_movie_videos_responses.dart';
import 'package:movies_app/models/responses/get_movies_responses.dart';

part 'movies_store.g.dart';

class MoviesStore = _MoviesStore with _$MoviesStore;

abstract class _MoviesStore with Store {
  final MoviesRepository _repository = MoviesRepository();

  // constructor:---------------------------------------------------------------
  _MoviesStore();

  final genres = ObservableList<GenreResponses>.of([]);

  final List<GenreResponses> selectedGenres = ObservableList<GenreResponses>.of([]);

  // actions:-------------------------------------------------------------------
  @action
  Future<bool> getGenres() async {
    try {
      final responses = await _repository.getGenres();

      genres.clear();
      genres.addAll(responses.genres);

      return true;
    } catch (e) {
      rethrow;
    }
  }

  @action
  Future<GetMoviesResponses> getMovies(GetMoviesParams params) async {
    try {
      final responses = await _repository.getMovies(params);

      return responses;
    } catch (e) {
      rethrow;
    }
  }

  @action
  Future<DetailMovieResponses> getMovieDetail(String movieId) async {
    try {
      final responses = await _repository.getMovieDetail(movieId);

      return responses;
    } catch (e) {
      rethrow;
    }
  }

  @action
  Future<GetMovieReviewsResponses> getMovieReviews(GetMovieReviewsParams params, String movieId) async {
    try {
      final responses = await _repository.getMovieReviews(params, movieId);

      return responses;
    } catch (e) {
      rethrow;
    }
  }

  @action
  Future<GetMovieVideosResponses> getMovieVideos(String movieId) async {
    try {
      final responses = await _repository.getMovieVideos(movieId);

      return responses;
    } catch (e) {
      rethrow;
    }
  }
}
