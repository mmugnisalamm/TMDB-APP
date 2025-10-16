class WatchlistModel {
  final int? id;
  final String posterPath;
  final String backdropPath;
  final String overview;
  final String name;
  final double voteAverage;

  WatchlistModel({
    required this.id,
    required this.posterPath,
    required this.backdropPath,
    required this.overview,
    required this.name,
    required this.voteAverage,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'poster_path': posterPath,
      'backdrop_path': backdropPath,
      'overview': overview,
      'name': name,
      'vote_average': voteAverage,
    };
  }

  factory WatchlistModel.fromMap(Map<String, dynamic> map) {
    return WatchlistModel(
      id: map['id'],
      posterPath: map['poster_path'],
      backdropPath: map['backdrop_path'],
      overview: map['overview'],
      name: map['name'],
      voteAverage: map['vote_average']?.toDouble() ?? 0.0,
    );
  }
}
