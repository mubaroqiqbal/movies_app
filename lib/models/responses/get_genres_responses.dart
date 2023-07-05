import 'package:json_annotation/json_annotation.dart';

part 'get_genres_responses.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class GetGenresResponses {
  final List<GenreResponses> genres;

  GetGenresResponses({this.genres = const []});

  factory GetGenresResponses.fromJson(Map<String, dynamic> json) => _$GetGenresResponsesFromJson(json);

  Map<String, dynamic> toJson() => _$GetGenresResponsesToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class GenreResponses {
  final int id;
  final String name;

  GenreResponses({this.id = 1, this.name = ""});

  factory GenreResponses.fromJson(Map<String, dynamic> json) => _$GenreResponsesFromJson(json);

  Map<String, dynamic> toJson() => _$GenreResponsesToJson(this);
}
