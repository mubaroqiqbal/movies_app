import 'package:movies_app/data/network/movies_api.dart';
import 'package:movies_app/models/params/get_movie_reviews_params.dart';
import 'package:movies_app/models/params/get_movies_params.dart';
import 'package:movies_app/models/responses/detail_movie_responses.dart';
import 'package:movies_app/models/responses/get_genres_responses.dart';
import 'package:movies_app/models/responses/get_movie_reviews_responses.dart';
import 'package:movies_app/models/responses/get_movie_videos_responses.dart';
import 'package:movies_app/models/responses/get_movies_responses.dart';

class MoviesRepository {
  final MoviesApi _api = MoviesApi();

  Future<GetGenresResponses> getGenres() async => _api.getGenres();
  Future<GetMoviesResponses> getMovies(GetMoviesParams params) async => _api.getMovies(params);
  Future<DetailMovieResponses> getMovieDetail(String movieId) async => _api.getMovieDetail(movieId);
  Future<GetMovieReviewsResponses> getMovieReviews(GetMovieReviewsParams params, String movieId) async => _api.getMovieReviews(params, movieId);
  Future<GetMovieVideosResponses> getMovieVideos(String movieId) async => _api.getMovieVideos(movieId);
}
