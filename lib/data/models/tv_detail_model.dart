import 'package:tmdb_app/data/models/cast_model.dart';
import 'package:tmdb_app/domain/entities/tv_detail_entity.dart';

class TvDetailModel extends TvDetailEntity {
  TvDetailModel({
    required super.id,
    required super.name,
    required super.overview,
    required super.posterPath,
    required super.backdropPath,
    required super.voteAverage,
    required super.firstAirDate,
    required super.genre,
    required List<CastModel> super.casts,
  });

  factory TvDetailModel.fromJson(
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

    return TvDetailModel(
      id: detailJson['id'] ?? 0,
      name: detailJson['name'] ?? '',
      overview: detailJson['overview'] ?? '',
      posterPath: detailJson['poster_path'] ?? '',
      backdropPath: detailJson['backdrop_path'] ?? '',
      voteAverage: (detailJson['vote_average'] ?? 0).toDouble(),
      firstAirDate: detailJson['first_air_date'] ?? '',
      genre: genresString,
      casts: casts,
    );
  }
}
