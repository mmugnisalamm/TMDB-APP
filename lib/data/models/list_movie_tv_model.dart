import 'package:tmdb_app/domain/entities/movie_tv_entity.dart';

class ListMovieTvModel extends MovieTVEntity {
  ListMovieTvModel({
    required super.id,
    required super.title,
    required super.name,
    required super.overview,
    required super.posterPath,
    required super.backdropPath,
    required super.mediaType,
    required super.releaseDate,
    required super.firstAirDate,
    required super.voteAverage,
  });

  factory ListMovieTvModel.fromJson(Map<String, dynamic> json) {
    return ListMovieTvModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? json['original_title'],
      name: json['name'] ?? json['original_name'],
      overview: json['overview'] ?? '',
      posterPath: json['poster_path'] ?? '',
      backdropPath: json['backdrop_path'] ?? '',
      mediaType: json['media_type'] ?? '',
      releaseDate: json['release_date'] ?? '',
      firstAirDate: json['first_air_date'] ?? '',
      voteAverage: (json['vote_average'] ?? 0).toDouble(),
    );
  }

  static List<ListMovieTvModel> fromJsonList(List<dynamic> list) {
    return list.map((e) => ListMovieTvModel.fromJson(e)).toList();
  }
}
