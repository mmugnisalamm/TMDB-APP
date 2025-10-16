import 'package:get/get.dart';
import 'package:tmdb_app/domain/entities/movie_detail_entity.dart';
import 'package:tmdb_app/domain/usecase/movie_detail_usecase.dart';

class MovieDetailController extends GetxController {
  final GetMovieDetailUseCase useCase;
  MovieDetailController(this.useCase);

  var isLoading = false.obs;
  var movieDetail = Rxn<MovieDetailEntity>();

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
}
