import 'package:get/get.dart';
import 'package:tmdb_app/domain/entities/tv_detail_entity.dart';
import 'package:tmdb_app/domain/usecase/tv_detail_usecase.dart';

class TvDetailController extends GetxController {
  final GetTvDetailUseCase useCase;
  TvDetailController(this.useCase);

  var isLoading = false.obs;
  var tvDetail = Rxn<TvDetailEntity>();

  Future<void> fetchTvDetail(int id) async {
    try {
      isLoading.value = true;
      tvDetail.value = await useCase.execute(id);
    } catch (e) {
      print("Error: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
