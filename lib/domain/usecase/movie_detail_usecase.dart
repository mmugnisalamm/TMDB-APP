import 'package:tmdb_app/domain/entities/movie_detail_entity.dart';
import 'package:tmdb_app/domain/repositories/movie_tv_repository.dart';

class GetMovieDetailUseCase {
  final MovieTvRepository repository;

  GetMovieDetailUseCase(this.repository);

  Future<MovieDetailEntity> execute(int movieId) {
    return repository.getMovieDetail(movieId);
  }
}
