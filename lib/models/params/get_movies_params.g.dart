// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_movies_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetMoviesParams _$GetMoviesParamsFromJson(Map<String, dynamic> json) =>
    GetMoviesParams(
      includeAdult: json['include_adult'] as bool? ?? false,
      includeVideo: json['include_video'] as bool? ?? false,
      page: json['page'] as int? ?? 1,
      sortBy: json['sort_by'] as String? ?? "popularity.desc",
      withGenres: json['with_genres'] as String? ?? "",
    );

Map<String, dynamic> _$GetMoviesParamsToJson(GetMoviesParams instance) =>
    <String, dynamic>{
      'include_adult': instance.includeAdult,
      'include_video': instance.includeVideo,
      'page': instance.page,
      'sort_by': instance.sortBy,
      'with_genres': instance.withGenres,
    };
