import 'package:get/get.dart';
import 'package:tmdb_app/data/repositories/movie_tv_repository_impl.dart';
import 'package:tmdb_app/data/services/dio_client.dart';
import 'package:tmdb_app/data/sources/movie_tv_remote_source.dart';
import 'package:tmdb_app/domain/usecase/movie_detail_usecase.dart';
import 'package:tmdb_app/domain/usecase/tv_detail_usecase.dart';
import 'package:tmdb_app/presentation/controllers/movie_detail_controller.dart';
import 'package:tmdb_app/presentation/controllers/tv_detail_controller.dart';

class DetailBinding extends Bindings {
  @override
  void dependencies() {
    final dioClient = DioClient();
    final remoteSource = MovieTvRemoteSource(dioClient);
    final repository = MovieTvRepositoryImpl(remoteSource);
    final useCaseMovie = GetMovieDetailUseCase(repository);
    final useCaseTv = GetTvDetailUseCase(repository);

    Get.lazyPut<MovieDetailController>(
      () => MovieDetailController(useCaseMovie),
    );

    Get.lazyPut<TvDetailController>(() => TvDetailController(useCaseTv));
  }
}
