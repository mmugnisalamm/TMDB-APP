import 'package:tmdb_app/domain/entities/tv_detail_entity.dart';
import 'package:tmdb_app/domain/repositories/movie_tv_repository.dart';

class GetTvDetailUseCase {
  final MovieTvRepository repository;

  GetTvDetailUseCase(this.repository);

  Future<TvDetailEntity> execute(int tvId) {
    return repository.getTvDetail(tvId);
  }
}
