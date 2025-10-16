import 'package:tmdb_app/domain/entities/review_entity.dart';
import 'package:tmdb_app/domain/repositories/movie_tv_repository.dart';

class GetMovieReviewsUseCase {
  final MovieTvRepository repository;

  GetMovieReviewsUseCase(this.repository);

  Future<List<ReviewEntity>> call(int movieId) {
    return repository.getMovieReviews(movieId);
  }
}
