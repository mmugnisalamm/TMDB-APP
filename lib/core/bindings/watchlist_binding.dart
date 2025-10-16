import 'package:get/get.dart';
import 'package:tmdb_app/presentation/controllers/tab_controller.dart';
import 'package:tmdb_app/presentation/controllers/watchlist_controller.dart';

class WatchlistBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WatchlistController>(() => WatchlistController(), fenix: true);
    Get.lazyPut<TabMenuController>(() => TabMenuController(), fenix: true);
  }
}
