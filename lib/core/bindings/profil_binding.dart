import 'package:get/get.dart';
import 'package:tmdb_app/presentation/controllers/lastwatch_controller.dart';

class ProfilBinding extends Bindings {
  @override
  void dependencies() {
    // No dependencies to inject for ProfilScreen at the moment.
    Get.lazyPut<LastwatchController>(() => LastwatchController(), fenix: true);
  }
}
