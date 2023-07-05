// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_movie_reviews_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetMovieReviewsParams _$GetMovieReviewsParamsFromJson(
        Map<String, dynamic> json) =>
    GetMovieReviewsParams(
      page: json['page'] as int? ?? 1,
      language: json['language'] as String? ?? "en-US",
    );

Map<String, dynamic> _$GetMovieReviewsParamsToJson(
        GetMovieReviewsParams instance) =>
    <String, dynamic>{
      'page': instance.page,
      'language': instance.language,
    };
