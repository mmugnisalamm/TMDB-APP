import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tmdb_app/presentation/components/floating_nav_bar.dart';
import 'package:tmdb_app/presentation/controllers/nav_controller.dart';
import 'package:tmdb_app/presentation/views/beranda_screen.dart';
import 'package:tmdb_app/presentation/views/profil_screen.dart';

import 'presentation/views/watchlist_screen/watchlist_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final NavController controller = Get.find<NavController>();

  final List<Widget> _pages = const [
    BerandaScreen(),
    WatchlistScreen(),
    ProfilScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Obx(() => _pages[controller.selectedIndex.value]),
          const Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: FloatingNavBar(),
          ),
        ],
      ),
    );
  }
}
