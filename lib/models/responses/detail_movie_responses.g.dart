// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_movie_responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailMovieResponses _$DetailMovieResponsesFromJson(
        Map<String, dynamic> json) =>
    DetailMovieResponses(
      id: json['id'] as int,
      genres: (json['genres'] as List<dynamic>?)
              ?.map(
                  (e) => ProductionCompany.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      voteCount: json['vote_count'] as int? ?? 0,
      voteAverage: (json['vote_average'] as num?)?.toDouble() ?? 0,
      video: json['video'] as bool? ?? false,
      title: json['title'] as String? ?? "",
      releaseDate: json['release_date'] as String? ?? "",
      posterPath: json['poster_path'] as String? ?? "",
      popularity: (json['popularity'] as num?)?.toDouble() ?? 0,
      overview: json['overview'] as String? ?? "",
      originalTitle: json['original_title'] as String? ?? "",
      tagline: json['tagline'] as String? ?? "",
      originalLanguage: json['original_language'] as String? ?? "",
      backdropPath: json['backdrop_path'] as String? ?? "",
      adult: json['adult'] as bool? ?? false,
      belongsToCollection: json['belongs_to_collection'] == null
          ? null
          : Collection.fromJson(
              json['belongs_to_collection'] as Map<String, dynamic>),
      budget: (json['budget'] as num?)?.toDouble() ?? 0,
      homepage: json['homepage'] as String? ?? "",
      imdbId: json['imdb_id'] as String? ?? "",
      productionCompanies: (json['production_companies'] as List<dynamic>?)
              ?.map(
                  (e) => ProductionCompany.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      productionCountries: (json['production_countries'] as List<dynamic>?)
              ?.map(
                  (e) => ProductionCountry.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      revenue: (json['revenue'] as num?)?.toDouble() ?? 0,
      runtime: json['runtime'] as int? ?? 0,
      spokenLanguages: (json['spoken_languages'] as List<dynamic>?)
              ?.map((e) => Language.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      status: json['status'] as String? ?? "",
    );

Map<String, dynamic> _$DetailMovieResponsesToJson(
        DetailMovieResponses instance) =>
    <String, dynamic>{
      'id': instance.id,
      'adult': instance.adult,
      'backdrop_path': instance.backdropPath,
      'belongs_to_collection': instance.belongsToCollection,
      'budget': instance.budget,
      'genres': instance.genres,
      'homepage': instance.homepage,
      'imdb_id': instance.imdbId,
      'original_language': instance.originalLanguage,
      'original_title': instance.originalTitle,
      'overview': instance.overview,
      'popularity': instance.popularity,
      'poster_path': instance.posterPath,
      'production_companies': instance.productionCompanies,
      'production_countries': instance.productionCountries,
      'release_date': instance.releaseDate,
      'revenue': instance.revenue,
      'runtime': instance.runtime,
      'spoken_languages': instance.spokenLanguages,
      'status': instance.status,
      'tagline': instance.tagline,
      'title': instance.title,
      'video': instance.video,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
    };

ProductionCompany _$ProductionCompanyFromJson(Map<String, dynamic> json) =>
    ProductionCompany(
      id: json['id'] as int? ?? 1,
      name: json['name'] as String? ?? "",
      logoPath: json['logo_path'] as String? ?? "",
      originCountry: json['origin_country'] as String? ?? "",
    );

Map<String, dynamic> _$ProductionCompanyToJson(ProductionCompany instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'logo_path': instance.logoPath,
      'origin_country': instance.originCountry,
    };

ProductionCountry _$ProductionCountryFromJson(Map<String, dynamic> json) =>
    ProductionCountry(
      iso31661: json['iso_3166_1'] as String? ?? "",
      name: json['name'] as String? ?? "",
    );

Map<String, dynamic> _$ProductionCountryToJson(ProductionCountry instance) =>
    <String, dynamic>{
      'iso_3166_1': instance.iso31661,
      'name': instance.name,
    };

Language _$LanguageFromJson(Map<String, dynamic> json) => Language(
      iso6391: json['iso_639_1'] as String? ?? "",
      name: json['name'] as String? ?? "",
      englishName: json['english_name'] as String? ?? "",
    );

Map<String, dynamic> _$LanguageToJson(Language instance) => <String, dynamic>{
      'iso_639_1': instance.iso6391,
      'name': instance.name,
      'english_name': instance.englishName,
    };

Collection _$CollectionFromJson(Map<String, dynamic> json) => Collection(
      id: json['id'] as int? ?? 1,
      name: json['name'] as String? ?? "",
      posterPath: json['poster_path'] as String? ?? "",
      backdropPath: json['backdrop_path'] as String? ?? "",
    );

Map<String, dynamic> _$CollectionToJson(Collection instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'poster_path': instance.posterPath,
      'backdrop_path': instance.backdropPath,
    };
