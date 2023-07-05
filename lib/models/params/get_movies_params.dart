import 'package:json_annotation/json_annotation.dart';

part 'get_movies_params.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class GetMoviesParams {
  final bool includeAdult;
  final bool includeVideo;
  final int page;
  final String sortBy;
  final String withGenres;

  GetMoviesParams({this.includeAdult = false, this.includeVideo = false, this.page = 1, this.sortBy = "popularity.desc", this.withGenres = ""});

  factory GetMoviesParams.fromJson(Map<String, dynamic> json) => _$GetMoviesParamsFromJson(json);

  Map<String, dynamic> toJson() => _$GetMoviesParamsToJson(this);
}
