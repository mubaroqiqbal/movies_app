import 'package:movies_app/constants/endpoints.dart';
import 'package:movies_app/data/dio_client.dart';
import 'package:movies_app/models/params/get_movie_reviews_params.dart';
import 'package:movies_app/models/params/get_movies_params.dart';
import 'package:movies_app/models/responses/detail_movie_responses.dart';
import 'package:movies_app/models/responses/get_genres_responses.dart';
import 'package:movies_app/models/responses/get_movie_reviews_responses.dart';
import 'package:movies_app/models/responses/get_movie_videos_responses.dart';
import 'package:movies_app/models/responses/get_movies_responses.dart';

class MoviesApi {
  final DioClient dio = DioClient();

  Future<GetGenresResponses> getGenres() async {
    try {
      final res = await dio.get(Endpoints.getGenres, queryParameters: {"language": "en"}) as Map<String, dynamic>;

      return GetGenresResponses.fromJson(res);
    } catch (e) {
      rethrow;
    }
  }

  Future<GetMoviesResponses> getMovies(GetMoviesParams params) async {
    try {
      final res = await dio.get(Endpoints.getMovies, queryParameters: params.toJson()) as Map<String, dynamic>;

      return GetMoviesResponses.fromJson(res);
    } catch (e) {
      rethrow;
    }
  }

  Future<DetailMovieResponses> getMovieDetail(String movieId) async {
    try {
      final res = await dio.get(Endpoints.getMovie + movieId) as Map<String, dynamic>;

      return DetailMovieResponses.fromJson(res);
    } catch (e) {
      rethrow;
    }
  }

  Future<GetMovieReviewsResponses> getMovieReviews(GetMovieReviewsParams params, String movieId) async {
    try {
      final res = await dio.get("${Endpoints.getMovie}$movieId/reviews", queryParameters: params.toJson()) as Map<String, dynamic>;

      return GetMovieReviewsResponses.fromJson(res);
    } catch (e) {
      rethrow;
    }
  }

  Future<GetMovieVideosResponses> getMovieVideos(String movieId) async {
    try {
      final res = await dio.get("${Endpoints.getMovie}$movieId/videos") as Map<String, dynamic>;

      return GetMovieVideosResponses.fromJson(res);
    } catch (e) {
      rethrow;
    }
  }
}
