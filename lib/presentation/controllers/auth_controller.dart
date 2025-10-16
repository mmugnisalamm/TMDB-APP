import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tmdb_app/core/utils/db_helper.dart';
import 'package:tmdb_app/data/models/user_model.dart';
import 'package:tmdb_app/presentation/views/login_screen.dart';

class AuthController extends GetxController {
  final DBHelper dbHelper = DBHelper();
  var currentUser = Rxn<UserModel>();
  var isLoggedIn = false.obs;

  Future<void> initDummyUser() async {
    await dbHelper.insertDummyUser();
  }

  @override
  void onInit() {
    super.onInit();
    loadUser();
  }

  Future<void> loadUser() async {
    final prefs = await SharedPreferences.getInstance();
    final email = prefs.getString("user_email");
    final name = prefs.getString("user_name");
    if (email != null && name != null) {
      currentUser.value = UserModel(email: email, name: name, password: "");
      isLoggedIn.value = true;
    }
  }

  Future<bool> login(String email, String password) async {
    final user = await dbHelper.login(email, password);
    if (user != null) {
      currentUser.value = user;
      isLoggedIn.value = true;

      // ✅ Simpan ke SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      prefs.setBool("isLogin", true);
      prefs.setString("user_email", user.email);
      prefs.setString("user_name", user.name);

      return true;
    }
    return false;
  }

  void logout() {
    currentUser.value = null;
    isLoggedIn.value = false;

    final prefs = Get.find<SharedPreferences>();
    prefs.clear();

    Get.off(LoginScreen());
  }
}
