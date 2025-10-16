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
    required List<CastModel> super.casts,
  });

  factory MovieDetailModel.fromJson(
    Map<String, dynamic> detailJson,
    List<dynamic> castJson,
  ) {
    final casts = castJson.map((e) => CastModel.fromJson(e)).toList();

    return MovieDetailModel(
      id: detailJson['id'] ?? 0,
      title: detailJson['title'] ?? '',
      overview: detailJson['overview'] ?? '',
      posterPath: detailJson['poster_path'] ?? '',
      backdropPath: detailJson['backdrop_path'] ?? '',
      voteAverage: (detailJson['vote_average'] ?? 0).toDouble(),
      releaseDate: detailJson['release_date'] ?? '',
      casts: casts,
    );
  }
}
