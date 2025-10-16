import 'package:tmdb_app/domain/entities/movie_tv_entity.dart';
import 'package:tmdb_app/domain/repositories/movie_tv_repository.dart';

class GetMovieTVUseCase {
  final MovieTvRepository repository;

  GetMovieTVUseCase(this.repository);

  Future<List<MovieTVEntity>> execute() {
    return repository.getMovieTVTrendingAll();
  }
}
