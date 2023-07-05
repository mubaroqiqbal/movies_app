import 'package:json_annotation/json_annotation.dart';

part 'get_movie_reviews_params.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class GetMovieReviewsParams {
  final int page;
  final String language;

  GetMovieReviewsParams({this.page = 1, this.language = "en-US"});

  factory GetMovieReviewsParams.fromJson(Map<String, dynamic> json) => _$GetMovieReviewsParamsFromJson(json);

  Map<String, dynamic> toJson() => _$GetMovieReviewsParamsToJson(this);
}
