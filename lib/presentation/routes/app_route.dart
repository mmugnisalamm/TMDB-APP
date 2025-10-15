import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tmdb_app/core/bindings/main_binding.dart';
import 'package:tmdb_app/core/bindings/trending_binding.dart';
import 'package:tmdb_app/main_screen.dart';
import 'package:tmdb_app/presentation/views/detail_screen.dart';
import 'package:tmdb_app/presentation/views/login_screen.dart';
import 'package:tmdb_app/presentation/views/trending_screen/trending_screen.dart';

class Routes {
  static const main = "/";
  static const login = "/login";
  static const trending = "/trending";
  static const kategori = "/kategori";
  static const detail = "/detail";
  static const profil = "/profil";
}

class AppRoutes {
  static final pages = [
    GetPage(
      name: Routes.main,
      page: () => const MainScreen(),
      bindings: [MainBinding()],
      middlewares: [
        // AuthMiddleware(),
      ],
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.login,
      page: () => const LoginScreen(),
      bindings: [],
      middlewares: [
        // AuthMiddleware(),
      ],
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.trending,
      page: () => const TrendingScreen(),
      bindings: [TrendingBinding()],
      middlewares: [
        // AuthMiddleware(),
      ],
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: Routes.detail,
      page: () => const DetailScreen(),
      bindings: [],
      middlewares: [
        // AuthMiddleware(),
      ],
      transition: Transition.rightToLeft,
    ),
  ];
}

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final prefs = Get.find<SharedPreferences>();
    final isLoggedIn = prefs.getBool("auth") ?? false;

    if (isLoggedIn) {
      print("✅ User sudah login, tetap di Home.");
      return null;
    } else {
      print("⚠️ User belum login, arahkan ke Login.");
      return const RouteSettings(name: Routes.login);
    }
  }
}
