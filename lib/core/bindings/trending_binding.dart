import 'package:get/get.dart';
import 'package:tmdb_app/data/repositories/movie_tv_repository_impl.dart';
import 'package:tmdb_app/data/services/dio_client.dart';
import 'package:tmdb_app/data/sources/movie_tv_remote_source.dart';
import 'package:tmdb_app/domain/usecase/movie_tv_usecase.dart';
import 'package:tmdb_app/presentation/controllers/tab_controller.dart';
import 'package:tmdb_app/presentation/controllers/trending_controller.dart';

class TrendingBinding extends Bindings {
  @override
  void dependencies() {
    final dioClient = DioClient();
    final remoteSource = MovieTvRemoteSource(dioClient);
    final repository = MovieTvRepositoryImpl(remoteSource);
    final useCase = GetMovieTVUseCase(repository);

    Get.lazyPut<TrendingController>(
      () => TrendingController(useCase),
      fenix: true,
    );
    Get.lazyPut<TabMenuController>(() => TabMenuController(), fenix: true);
  }
}
