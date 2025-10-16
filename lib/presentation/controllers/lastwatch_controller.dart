import 'package:get/get.dart';
import 'package:tmdb_app/core/utils/db_helper.dart';
import 'package:tmdb_app/data/models/watchlist_model.dart';

class LastwatchController extends GetxController {
  final DBHelper dbHelper = DBHelper();
  var lastwatch = <WatchlistModel>[].obs;

  Future<void> loadLastWatch() async {
    lastwatch.value = await dbHelper.getLastWatch();
  }

  Future<void> addLastWatch(WatchlistModel item) async {
    final exists = await dbHelper.isLastWatchExist(item.name);
    if (!exists) {
      await dbHelper.addLastWatch(item);
      await loadLastWatch();
    }
  }
}
