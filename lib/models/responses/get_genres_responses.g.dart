// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_genres_responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetGenresResponses _$GetGenresResponsesFromJson(Map<String, dynamic> json) =>
    GetGenresResponses(
      genres: (json['genres'] as List<dynamic>?)
              ?.map((e) => GenreResponses.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$GetGenresResponsesToJson(GetGenresResponses instance) =>
    <String, dynamic>{
      'genres': instance.genres,
    };

GenreResponses _$GenreResponsesFromJson(Map<String, dynamic> json) =>
    GenreResponses(
      id: json['id'] as int? ?? 1,
      name: json['name'] as String? ?? "",
    );

Map<String, dynamic> _$GenreResponsesToJson(GenreResponses instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
