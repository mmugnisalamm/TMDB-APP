import 'package:get/get.dart';
import 'package:tmdb_app/domain/entities/movie_detail_entity.dart';
import 'package:tmdb_app/domain/entities/review_entity.dart';
import 'package:tmdb_app/domain/usecase/movie_certification_usecase.dart';
import 'package:tmdb_app/domain/usecase/movie_detail_usecase.dart';
import 'package:tmdb_app/domain/usecase/movie_review_usecase.dart';

class MovieDetailController extends GetxController {
  final GetMovieDetailUseCase useCase;
  final GetMovieCertificationUseCase getMovieCertificationUseCase;
  final GetMovieReviewsUseCase getMovieCReviewUseCase;
  MovieDetailController(
    this.useCase,
    this.getMovieCertificationUseCase,
    this.getMovieCReviewUseCase,
  );

  var isLoading = false.obs;
  var movieDetail = Rxn<MovieDetailEntity>();
  var certificationLabel = ''.obs;

  Future<void> fetchMovieDetail(int id) async {
    try {
      isLoading.value = true;
      movieDetail.value = await useCase.execute(id);
    } catch (e) {
      print("Error: $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchMovieRating(int movieId) async {
    final rating = await getMovieCertificationUseCase.execute(movieId);
    certificationLabel.value = mapCertificationToIndonesia(rating);
  }

  // konversi rating dari TMDB ke Indonesia
  String mapCertificationToIndonesia(String? cert) {
    if (cert == null || cert.isEmpty) return 'SU';

    switch (cert.toUpperCase()) {
      case 'G':
      case 'PG':
      case 'SU':
        return 'SU';
      case 'PG-13':
      case '13+':
        return 'R';
      case 'R':
      case '17+':
        return 'D';
      case 'NC-17':
      case '21+':
        return '21+';
      default:
        return 'SU';
    }
  }

  var reviews = <ReviewEntity>[].obs;
  var isLoadingCast = false.obs;

  Future<void> fetchMovieReviews(int movieId) async {
    try {
      isLoadingCast(true);
      final result = await getMovieCReviewUseCase(movieId);
      reviews.assignAll(result);
    } catch (e) {
      print("Error fetching reviews: $e");
    } finally {
      isLoadingCast(false);
    }
  }
}
