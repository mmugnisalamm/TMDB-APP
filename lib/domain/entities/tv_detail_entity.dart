import 'package:tmdb_app/domain/entities/cast_entity.dart';

class TvDetailEntity {
  final int id;
  final String name;
  final String overview;
  final String posterPath;
  final String backdropPath;
  final double voteAverage;
  final String firstAirDate;
  final List<CastEntity> casts;

  TvDetailEntity({
    required this.id,
    required this.name,
    required this.overview,
    required this.posterPath,
    required this.backdropPath,
    required this.voteAverage,
    required this.firstAirDate,
    required this.casts,
  });
}
