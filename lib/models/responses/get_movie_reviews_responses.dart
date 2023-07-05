import 'package:json_annotation/json_annotation.dart';

part 'get_movie_reviews_responses.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class GetMovieReviewsResponses {
  final int id;
  final int page;
  final int totalPages;
  final int totalResults;
  final List<MovieReviewResponses> results;

  GetMovieReviewsResponses({this.results = const [], required this.id, this.page = 1, this.totalPages = 0, this.totalResults = 0});

  factory GetMovieReviewsResponses.fromJson(Map<String, dynamic> json) => _$GetMovieReviewsResponsesFromJson(json);

  Map<String, dynamic> toJson() => _$GetMovieReviewsResponsesToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class MovieReviewResponses {
  final String author;
  final Author? authorDetails;
  final String content;
  final String id;
  final String updatedAt;
  final String createdAt;
  final String url;

  MovieReviewResponses({
    required this.id,
    this.author = "",
    this.authorDetails,
    this.content = "",
    this.updatedAt = "",
    this.createdAt = "",
    this.url = "",
  });

  factory MovieReviewResponses.fromJson(Map<String, dynamic> json) => _$MovieReviewResponsesFromJson(json);

  Map<String, dynamic> toJson() => _$MovieReviewResponsesToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Author {
  final String name;
  final String username;
  final String avatarPath;
  final double rating;

  Author({this.name = "", this.username = "", this.avatarPath = "", this.rating = 0});

  factory Author.fromJson(Map<String, dynamic> json) => _$AuthorFromJson(json);

  Map<String, dynamic> toJson() => _$AuthorToJson(this);
}
