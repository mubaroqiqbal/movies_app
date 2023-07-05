import 'package:json_annotation/json_annotation.dart';

part 'get_movies_responses.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class GetMoviesResponses {
  final int page;
  final int totalPages;
  final int totalResults;
  final List<ItemMovieResponses> results;

  GetMoviesResponses({this.results = const [], this.page = 1, this.totalPages = 0, this.totalResults = 0});

  factory GetMoviesResponses.fromJson(Map<String, dynamic> json) => _$GetMoviesResponsesFromJson(json);

  Map<String, dynamic> toJson() => _$GetMoviesResponsesToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class ItemMovieResponses {
  final bool adult;
  final String backdropPath;
  final List<int> genreIds;
  final int id;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String posterPath;
  final String releaseDate;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;

  ItemMovieResponses({
    required this.id,
    this.adult = false,
    this.backdropPath = "",
    this.genreIds = const [],
    this.originalLanguage = "",
    this.originalTitle = "",
    this.overview = "",
    this.popularity = 0,
    this.posterPath = "",
    this.releaseDate = "",
    this.title = "",
    this.video = false,
    this.voteAverage = 0,
    this.voteCount = 0,
  });

  factory ItemMovieResponses.fromJson(Map<String, dynamic> json) => _$ItemMovieResponsesFromJson(json);

  Map<String, dynamic> toJson() => _$ItemMovieResponsesToJson(this);
}
