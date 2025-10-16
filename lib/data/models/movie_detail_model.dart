import 'package:tmdb_app/data/models/cast_model.dart';
import 'package:tmdb_app/domain/entities/movie_detail_entity.dart';

class MovieDetailModel extends MovieDetailEntity {
  MovieDetailModel({
    required super.id,
    required super.title,
    required super.overview,
    required super.posterPath,
    required super.backdropPath,
    required super.voteAverage,
    required super.releaseDate,
    required super.genre,
    required super.budget,
    required super.revenue,
    required super.originalLanguage,
    required super.runtime,
    required super.status,
    required super.language,
    required List<CastModel> super.casts,
  });

  factory MovieDetailModel.fromJson(
    Map<String, dynamic> detailJson,
    List<dynamic> castJson,
  ) {
    final casts = castJson.map((e) => CastModel.fromJson(e)).toList();

    final genresList =
        (detailJson['genres'] as List?)
            ?.map((g) => g['name'] as String)
            .toList() ??
        [];
    final genresString = genresList.join(', ');

    final langList =
        (detailJson['spoken_languages'] as List?)
            ?.map((g) => g['name'] as String)
            .toList() ??
        [];
    final langString = langList.join(', ');

    return MovieDetailModel(
      id: detailJson['id'] ?? 0,
      title: detailJson['title'] ?? '',
      overview: detailJson['overview'] ?? '',
      posterPath: detailJson['poster_path'] ?? '',
      backdropPath: detailJson['backdrop_path'] ?? '',
      voteAverage: (detailJson['vote_average'] ?? 0).toDouble(),
      releaseDate: detailJson['release_date'] ?? '',
      genre: genresString,
      budget: (detailJson['budget'] ?? 0).toDouble(),
      revenue: (detailJson['revenue'] ?? 0).toDouble(),
      originalLanguage: detailJson['original_language'] ?? '',
      runtime: (detailJson['runtime'] ?? 0),
      status: detailJson['status'] ?? '',
      language: langString,
      casts: casts,
    );
  }
}
