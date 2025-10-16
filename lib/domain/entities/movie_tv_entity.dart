class MovieTVEntity {
  final int id;
  final String? title;
  final String? name;
  final String overview;
  final String posterPath;
  final String backdropPath;
  final String mediaType;
  final String releaseDate;
  final String firstAirDate;
  final double voteAverage;

  MovieTVEntity({
    required this.id,
    required this.title,
    required this.name,
    required this.overview,
    required this.posterPath,
    required this.backdropPath,
    required this.mediaType,
    required this.releaseDate,
    required this.firstAirDate,
    required this.voteAverage,
  });
}
