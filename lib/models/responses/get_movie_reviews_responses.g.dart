// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_movie_reviews_responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetMovieReviewsResponses _$GetMovieReviewsResponsesFromJson(
        Map<String, dynamic> json) =>
    GetMovieReviewsResponses(
      results: (json['results'] as List<dynamic>?)
              ?.map((e) =>
                  MovieReviewResponses.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      id: json['id'] as int,
      page: json['page'] as int? ?? 1,
      totalPages: json['total_pages'] as int? ?? 0,
      totalResults: json['total_results'] as int? ?? 0,
    );

Map<String, dynamic> _$GetMovieReviewsResponsesToJson(
        GetMovieReviewsResponses instance) =>
    <String, dynamic>{
      'id': instance.id,
      'page': instance.page,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
      'results': instance.results,
    };

MovieReviewResponses _$MovieReviewResponsesFromJson(
        Map<String, dynamic> json) =>
    MovieReviewResponses(
      id: json['id'] as String,
      author: json['author'] as String? ?? "",
      authorDetails: json['author_details'] == null
          ? null
          : Author.fromJson(json['author_details'] as Map<String, dynamic>),
      content: json['content'] as String? ?? "",
      updatedAt: json['updated_at'] as String? ?? "",
      createdAt: json['created_at'] as String? ?? "",
      url: json['url'] as String? ?? "",
    );

Map<String, dynamic> _$MovieReviewResponsesToJson(
        MovieReviewResponses instance) =>
    <String, dynamic>{
      'author': instance.author,
      'author_details': instance.authorDetails,
      'content': instance.content,
      'id': instance.id,
      'updated_at': instance.updatedAt,
      'created_at': instance.createdAt,
      'url': instance.url,
    };

Author _$AuthorFromJson(Map<String, dynamic> json) => Author(
      name: json['name'] as String? ?? "",
      username: json['username'] as String? ?? "",
      avatarPath: json['avatar_path'] as String? ?? "",
      rating: (json['rating'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$AuthorToJson(Author instance) => <String, dynamic>{
      'name': instance.name,
      'username': instance.username,
      'avatar_path': instance.avatarPath,
      'rating': instance.rating,
    };
