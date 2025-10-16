import 'package:tmdb_app/domain/repositories/movie_tv_repository.dart';

class GetMovieCertificationUseCase {
  final MovieTvRepository repository;

  GetMovieCertificationUseCase(this.repository);

  Future<String?> execute(int movieId) {
    return repository.getMovieCertification(movieId);
  }
}
