import 'package:json_annotation/json_annotation.dart';
import 'package:movies_app/models/responses/get_genres_responses.dart';

part 'detail_movie_responses.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class DetailMovieResponses {
  final int id;
  final bool adult;
  final String backdropPath;
  final Collection? belongsToCollection;
  final double budget;
  final List<ProductionCompany> genres;
  final String homepage;
  final String imdbId;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String posterPath;
  final List<ProductionCompany> productionCompanies;
  final List<ProductionCountry> productionCountries;
  final String releaseDate;
  final double revenue;
  final int runtime;
  final List<Language> spokenLanguages;
  final String status;
  final String tagline;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;

  DetailMovieResponses({
    required this.id,
    this.genres = const [],
    this.voteCount = 0,
    this.voteAverage = 0,
    this.video = false,
    this.title = "",
    this.releaseDate = "",
    this.posterPath = "",
    this.popularity = 0,
    this.overview = "",
    this.originalTitle = "",
    this.tagline = "",
    this.originalLanguage = "",
    this.backdropPath = "",
    this.adult = false,
    this.belongsToCollection,
    this.budget = 0,
    this.homepage = "",
    this.imdbId = "",
    this.productionCompanies = const [],
    this.productionCountries = const [],
    this.revenue = 0,
    this.runtime = 0,
    this.spokenLanguages = const [],
    this.status = "",
  });

  factory DetailMovieResponses.fromJson(Map<String, dynamic> json) => _$DetailMovieResponsesFromJson(json);

  Map<String, dynamic> toJson() => _$DetailMovieResponsesToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class ProductionCompany {
  final int id;
  final String name;
  final String logoPath;
  final String originCountry;

  ProductionCompany({this.id = 1, this.name = "", this.logoPath = "", this.originCountry = ""});

  factory ProductionCompany.fromJson(Map<String, dynamic> json) => _$ProductionCompanyFromJson(json);

  Map<String, dynamic> toJson() => _$ProductionCompanyToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class ProductionCountry {
  @JsonKey(name: "iso_3166_1")
  final String iso31661;
  final String name;

  ProductionCountry({this.iso31661 = "", this.name = ""});

  factory ProductionCountry.fromJson(Map<String, dynamic> json) => _$ProductionCountryFromJson(json);

  Map<String, dynamic> toJson() => _$ProductionCountryToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Language {
  @JsonKey(name: "iso_639_1")
  final String iso6391;
  final String name;
  final String englishName;

  Language({this.iso6391 = "", this.name = "", this.englishName = ""});

  factory Language.fromJson(Map<String, dynamic> json) => _$LanguageFromJson(json);

  Map<String, dynamic> toJson() => _$LanguageToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Collection {
  final int id;
  final String name;
  final String posterPath;
  final String backdropPath;

  Collection({this.id = 1, this.name = "", this.posterPath = "", this.backdropPath = ""});

  factory Collection.fromJson(Map<String, dynamic> json) => _$CollectionFromJson(json);

  Map<String, dynamic> toJson() => _$CollectionToJson(this);
}
