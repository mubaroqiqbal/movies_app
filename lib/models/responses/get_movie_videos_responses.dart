import 'package:json_annotation/json_annotation.dart';

part 'get_movie_videos_responses.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class GetMovieVideosResponses {
  final int id;
  final List<MovieVideoResponses> results;

  GetMovieVideosResponses({this.results = const [], required this.id});

  factory GetMovieVideosResponses.fromJson(Map<String, dynamic> json) => _$GetMovieVideosResponsesFromJson(json);

  Map<String, dynamic> toJson() => _$GetMovieVideosResponsesToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class MovieVideoResponses {
  final String id;
  @JsonKey(name: "iso_639_1")
  final String iso6391;
  @JsonKey(name: "iso_3166_1")
  final String iso31661;
  final String name;
  final String key;
  final String site;
  final double size;
  final String type;
  final bool official;
  final String publishedAt;

  MovieVideoResponses({
    required this.id,
    this.name = "",
    this.size = 0,
    this.iso6391 = "",
    this.iso31661 = "",
    this.key = "",
    this.type = "",
    this.official = false,
    this.publishedAt = "",
    this.site = "",
  });

  factory MovieVideoResponses.fromJson(Map<String, dynamic> json) => _$MovieVideoResponsesFromJson(json);

  Map<String, dynamic> toJson() => _$MovieVideoResponsesToJson(this);
}
