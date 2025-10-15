import 'package:get/get.dart';
import 'package:tmdb_app/presentation/controllers/trending_controller.dart';

class TrendingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TrendingController>(() => TrendingController());
  }
}
