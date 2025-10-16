import 'package:tmdb_app/data/sources/movie_tv_remote_source.dart';
import 'package:tmdb_app/domain/entities/movie_detail_entity.dart';
import 'package:tmdb_app/domain/entities/movie_tv_entity.dart';
import 'package:tmdb_app/domain/entities/tv_detail_entity.dart';
import 'package:tmdb_app/domain/repositories/movie_tv_repository.dart';

class MovieTvRepositoryImpl implements MovieTvRepository {
  final MovieTvRemoteSource remoteSource;

  MovieTvRepositoryImpl(this.remoteSource);

  @override
  Future<List<MovieTVEntity>> getMovieTVTrendingAll() async {
    return await remoteSource.getMovieTVTrendingAll();
  }

  @override
  Future<MovieDetailEntity> getMovieDetail(int movieId) async {
    return await remoteSource.getMovieDetail(movieId);
  }

  @override
  Future<TvDetailEntity> getTvDetail(int tvId) async {
    return await remoteSource.getTvDetail(tvId);
  }
}
