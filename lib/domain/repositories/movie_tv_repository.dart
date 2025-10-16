import 'package:tmdb_app/domain/entities/movie_detail_entity.dart';
import 'package:tmdb_app/domain/entities/movie_tv_entity.dart';
import 'package:tmdb_app/domain/entities/review_entity.dart';
import 'package:tmdb_app/domain/entities/tv_detail_entity.dart';

abstract class MovieTvRepository {
  Future<List<MovieTVEntity>> getMovieTVTrendingAll();

  Future<MovieDetailEntity> getMovieDetail(int movieId);
  Future<String?> getMovieCertification(int movieId);
  Future<TvDetailEntity> getTvDetail(int tvId);

  Future<List<ReviewEntity>> getMovieReviews(int movieId);
}
