import 'package:get/get.dart';
import 'package:tmdb_app/presentation/controllers/nav_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavController>(() => NavController());
  }
}
