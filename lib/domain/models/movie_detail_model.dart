import 'package:equatable/equatable.dart';

class MovieDetails extends Equatable {
  final bool adult;
  final String? backdropPath;
  final Collection? belongsToCollection;
  final int budget;
  final List<Genre> genres;
  final String? homepage;
  final int id;
  final String? imdbId;
  final List<String> originCountry;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String? posterPath;
  final List<ProductionCompany> productionCompanies;
  final List<ProductionCountry> productionCountries;
  final String? releaseDate;
  final int revenue;
  final int runtime;
  final List<SpokenLanguage> spokenLanguages;
  final String status;
  final String? tagline;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;

  const MovieDetails({
    required this.adult,
    this.backdropPath,
    this.belongsToCollection,
    required this.budget,
    required this.genres,
    this.homepage,
    required this.id,
    this.imdbId,
    required this.originCountry,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    this.posterPath,
    required this.productionCompanies,
    required this.productionCountries,
    this.releaseDate,
    required this.revenue,
    required this.runtime,
    required this.spokenLanguages,
    required this.status,
    this.tagline,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  factory MovieDetails.fromJson(Map<String, dynamic> json) {
    return MovieDetails(
      adult: json['adult'] ?? false,
      backdropPath: json['backdrop_path'],
      belongsToCollection: json['belongs_to_collection'] != null
          ? Collection.fromJson(json['belongs_to_collection'])
          : null,
      budget: json['budget'] ?? 0,
      genres: List<Genre>.from(json['genres']?.map((x) => Genre.fromJson(x)) ?? []),
      homepage: json['homepage'],
      id: json['id'] ?? 0,
      imdbId: json['imdb_id'],
      originCountry: List<String>.from(json['origin_country'] ?? []),
      originalLanguage: json['original_language'] ?? '',
      originalTitle: json['original_title'] ?? '',
      overview: json['overview'] ?? '',
      popularity: (json['popularity'] ?? 0).toDouble(),
      posterPath: json['poster_path'],
      productionCompanies: List<ProductionCompany>.from(
          json['production_companies']?.map((x) => ProductionCompany.fromJson(x)) ?? []),
      productionCountries: List<ProductionCountry>.from(
          json['production_countries']?.map((x) => ProductionCountry.fromJson(x)) ?? []),
      releaseDate: json['release_date'],
      revenue: json['revenue'] ?? 0,
      runtime: json['runtime'] ?? 0,
      spokenLanguages: List<SpokenLanguage>.from(
          json['spoken_languages']?.map((x) => SpokenLanguage.fromJson(x)) ?? []),
      status: json['status'] ?? '',
      tagline: json['tagline'],
      title: json['title'] ?? '',
      video: json['video'] ?? false,
      voteAverage: (json['vote_average'] ?? 0).toDouble(),
      voteCount: json['vote_count'] ?? 0,
    );
  }

  @override
  List<Object?> get props => [
    adult,
    backdropPath,
    belongsToCollection,
    budget,
    genres,
    homepage,
    id,
    imdbId,
    originCountry,
    originalLanguage,
    originalTitle,
    overview,
    popularity,
    posterPath,
    productionCompanies,
    productionCountries,
    releaseDate,
    revenue,
    runtime,
    spokenLanguages,
    status,
    tagline,
    title,
    video,
    voteAverage,
    voteCount,
  ];
}

class Collection extends Equatable {
  final int id;
  final String name;
  final String? posterPath;
  final String? backdropPath;

  const Collection({
    required this.id,
    required this.name,
    this.posterPath,
    this.backdropPath,
  });

  factory Collection.fromJson(Map<String, dynamic> json) {
    return Collection(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      posterPath: json['poster_path'],
      backdropPath: json['backdrop_path'],
    );
  }

  @override
  List<Object?> get props => [id, name, posterPath, backdropPath];
}

class Genre extends Equatable {
  final int id;
  final String name;

  const Genre({
    required this.id,
    required this.name,
  });

  factory Genre.fromJson(Map<String, dynamic> json) {
    return Genre(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
    );
  }

  @override
  List<Object?> get props => [id, name];
}

class ProductionCompany extends Equatable {
  final int id;
  final String? logoPath;
  final String name;
  final String originCountry;

  const ProductionCompany({
    required this.id,
    this.logoPath,
    required this.name,
    required this.originCountry,
  });

  factory ProductionCompany.fromJson(Map<String, dynamic> json) {
    return ProductionCompany(
      id: json['id'] ?? 0,
      logoPath: json['logo_path'],
      name: json['name'] ?? '',
      originCountry: json['origin_country'] ?? '',
    );
  }

  @override
  List<Object?> get props => [id, logoPath, name, originCountry];
}

class ProductionCountry extends Equatable {
  final String iso31661;
  final String name;

  const ProductionCountry({
    required this.iso31661,
    required this.name,
  });

  factory ProductionCountry.fromJson(Map<String, dynamic> json) {
    return ProductionCountry(
      iso31661: json['iso_3166_1'] ?? '',
      name: json['name'] ?? '',
    );
  }

  @override
  List<Object?> get props => [iso31661, name];
}

class SpokenLanguage extends Equatable {
  final String englishName;
  final String iso6391;
  final String name;

  const SpokenLanguage({
    required this.englishName,
    required this.iso6391,
    required this.name,
  });

  factory SpokenLanguage.fromJson(Map<String, dynamic> json) {
    return SpokenLanguage(
      englishName: json['english_name'] ?? '',
      iso6391: json['iso_639_1'] ?? '',
      name: json['name'] ?? '',
    );
  }

  @override
  List<Object?> get props => [englishName, iso6391, name];
}