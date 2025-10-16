import 'cast_entity.dart';

class MovieDetailEntity {
  final int id;
  final String title;
  final String overview;
  final String posterPath;
  final String backdropPath;
  final double voteAverage;
  final String releaseDate;
  final String genre;
  final double budget;
  final double revenue;
  final String originalLanguage;
  final int runtime;
  final String status;
  final String language;
  final List<CastEntity> casts;

  MovieDetailEntity({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.backdropPath,
    required this.voteAverage,
    required this.releaseDate,
    required this.genre,
    required this.budget,
    required this.revenue,
    required this.originalLanguage,
    required this.runtime,
    required this.status,
    required this.language,
    required this.casts,
  });
}
