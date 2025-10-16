import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tmdb_app/core/bindings/auth_binding.dart';
import 'package:tmdb_app/core/bindings/detail_binding.dart';
import 'package:tmdb_app/core/bindings/main_binding.dart';
import 'package:tmdb_app/core/bindings/profil_binding.dart';
import 'package:tmdb_app/core/bindings/trending_binding.dart';
import 'package:tmdb_app/core/bindings/watchlist_binding.dart';
import 'package:tmdb_app/main_screen.dart';
import 'package:tmdb_app/presentation/views/detail_movie_screen.dart';
import 'package:tmdb_app/presentation/views/detail_tv_screen.dart';
import 'package:tmdb_app/presentation/views/login_screen.dart';
import 'package:tmdb_app/presentation/views/trending_screen/trending_screen.dart';

class Routes {
  static const main = "/";
  static const login = "/login";
  static const trending = "/trending";
  static const kategori = "/kategori";
  static const movieDetail = "/movie-detail";
  static const tvDetail = "/tv-detail";
  static const profil = "/profil";
}

class AppRoutes {
  static final pages = [
    GetPage(
      name: Routes.main,
      page: () => const MainScreen(),
      bindings: [MainBinding(), WatchlistBinding(), ProfilBinding()],
      middlewares: [AuthMiddleware()],
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.login,
      page: () => const LoginScreen(),
      bindings: [AuthBinding()],
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.trending,
      page: () => const TrendingScreen(),
      bindings: [TrendingBinding()],
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: Routes.movieDetail,
      page: () => const MovieDetailScreen(),
      bindings: [DetailBinding()],
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: Routes.tvDetail,
      page: () => const TvDetailScreen(),
      bindings: [DetailBinding(), WatchlistBinding()],
      transition: Transition.rightToLeft,
    ),
  ];
}

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final prefs = Get.find<SharedPreferences>();
    final isLoggedIn = prefs.getBool("isLogin") ?? false;

    if (isLoggedIn) {
      print("✅ User sudah login, tetap di Home.");
      return null;
    } else {
      print("⚠️ User belum login, arahkan ke Login.");
      return const RouteSettings(name: Routes.login);
    }
  }
}
