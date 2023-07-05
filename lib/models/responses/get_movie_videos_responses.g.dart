// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_movie_videos_responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetMovieVideosResponses _$GetMovieVideosResponsesFromJson(
        Map<String, dynamic> json) =>
    GetMovieVideosResponses(
      results: (json['results'] as List<dynamic>?)
              ?.map((e) =>
                  MovieVideoResponses.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      id: json['id'] as int,
    );

Map<String, dynamic> _$GetMovieVideosResponsesToJson(
        GetMovieVideosResponses instance) =>
    <String, dynamic>{
      'id': instance.id,
      'results': instance.results,
    };

MovieVideoResponses _$MovieVideoResponsesFromJson(Map<String, dynamic> json) =>
    MovieVideoResponses(
      id: json['id'] as String,
      name: json['name'] as String? ?? "",
      size: (json['size'] as num?)?.toDouble() ?? 0,
      iso6391: json['iso_639_1'] as String? ?? "",
      iso31661: json['iso_3166_1'] as String? ?? "",
      key: json['key'] as String? ?? "",
      type: json['type'] as String? ?? "",
      official: json['official'] as bool? ?? false,
      publishedAt: json['published_at'] as String? ?? "",
      site: json['site'] as String? ?? "",
    );

Map<String, dynamic> _$MovieVideoResponsesToJson(
        MovieVideoResponses instance) =>
    <String, dynamic>{
      'id': instance.id,
      'iso_639_1': instance.iso6391,
      'iso_3166_1': instance.iso31661,
      'name': instance.name,
      'key': instance.key,
      'site': instance.site,
      'size': instance.size,
      'type': instance.type,
      'official': instance.official,
      'published_at': instance.publishedAt,
    };
