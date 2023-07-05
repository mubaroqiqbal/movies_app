// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_movies_responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetMoviesResponses _$GetMoviesResponsesFromJson(Map<String, dynamic> json) =>
    GetMoviesResponses(
      results: (json['results'] as List<dynamic>?)
              ?.map(
                  (e) => ItemMovieResponses.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      page: json['page'] as int? ?? 1,
      totalPages: json['total_pages'] as int? ?? 0,
      totalResults: json['total_results'] as int? ?? 0,
    );

Map<String, dynamic> _$GetMoviesResponsesToJson(GetMoviesResponses instance) =>
    <String, dynamic>{
      'page': instance.page,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
      'results': instance.results,
    };

ItemMovieResponses _$ItemMovieResponsesFromJson(Map<String, dynamic> json) =>
    ItemMovieResponses(
      id: json['id'] as int,
      adult: json['adult'] as bool? ?? false,
      backdropPath: json['backdrop_path'] as String? ?? "",
      genreIds: (json['genre_ids'] as List<dynamic>?)
              ?.map((e) => e as int)
              .toList() ??
          const [],
      originalLanguage: json['original_language'] as String? ?? "",
      originalTitle: json['original_title'] as String? ?? "",
      overview: json['overview'] as String? ?? "",
      popularity: (json['popularity'] as num?)?.toDouble() ?? 0,
      posterPath: json['poster_path'] as String? ?? "",
      releaseDate: json['release_date'] as String? ?? "",
      title: json['title'] as String? ?? "",
      video: json['video'] as bool? ?? false,
      voteAverage: (json['vote_average'] as num?)?.toDouble() ?? 0,
      voteCount: json['vote_count'] as int? ?? 0,
    );

Map<String, dynamic> _$ItemMovieResponsesToJson(ItemMovieResponses instance) =>
    <String, dynamic>{
      'adult': instance.adult,
      'backdrop_path': instance.backdropPath,
      'genre_ids': instance.genreIds,
      'id': instance.id,
      'original_language': instance.originalLanguage,
      'original_title': instance.originalTitle,
      'overview': instance.overview,
      'popularity': instance.popularity,
      'poster_path': instance.posterPath,
      'release_date': instance.releaseDate,
      'title': instance.title,
      'video': instance.video,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
    };
