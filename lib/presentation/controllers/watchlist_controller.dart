import 'package:get/get.dart';
import 'package:tmdb_app/data/models/watchlist_model.dart';

import '../../core/utils/db_helper.dart';

class WatchlistController extends GetxController {
  final DBHelper dbHelper = DBHelper();
  var watchlist = <WatchlistModel>[].obs;

  Future<void> loadWatchlist() async {
    watchlist.value = await dbHelper.getWatchlist();
  }

  Future<void> addToWatchlist(WatchlistModel item) async {
    final exists = await dbHelper.isInWatchlist(item.name);
    if (!exists) {
      await dbHelper.addWatchlist(item);
      isWatchlist.value = true;
      await loadWatchlist();
    }
  }

  Future<void> removeFromWatchlist(int id) async {
    await dbHelper.deleteWatchlist(id);
    isWatchlist.value = false;
    await loadWatchlist();
  }

  var isWatchlist = false.obs;

  Future<void> checkIsInWatchlist(String name) async {
    final result = await dbHelper.isInWatchlist(name);
    isWatchlist.value = result; // update RxBool
  }
}
