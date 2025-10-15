import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tmdb_app/core/constants/color_assets.dart';
import 'package:tmdb_app/core/constants/image_assets.dart';
import 'package:tmdb_app/presentation/controllers/trending_controller.dart';
import 'package:tmdb_app/presentation/views/trending_screen/all_screen.dart';
import 'package:tmdb_app/presentation/views/trending_screen/movie_screen.dart';
import 'package:tmdb_app/presentation/views/trending_screen/tv_screen.dart';

class TrendingScreen extends StatefulWidget {
  const TrendingScreen({super.key});

  @override
  State<TrendingScreen> createState() => _TrendingScreenState();
}

class _TrendingScreenState extends State<TrendingScreen> {
  final TrendingController c = Get.find<TrendingController>();

  final tabs = ['Semua', 'Film', 'Serial TV'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: Center(
          child: AppBar(
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.transparent,
            toolbarHeight: 120.0,
            centerTitle: true,
            title: const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Trending Hari Ini",
                style: TextStyle(color: Colors.black),
              ),
            ),
            iconTheme: const IconThemeData(color: Colors.black),
            automaticallyImplyLeading: true,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // 🔹 Custom Tab Menu di Body
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24, bottom: 12),
              child: Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: List.generate(tabs.length, (index) {
                    final isSelected = c.selectedIndex.value == index;
                    return GestureDetector(
                      onTap: () => c.changeTab(index),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 12,
                        ),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? Colors.blue
                              : Colors.blue.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Text(
                              tabs[index],
                              style: TextStyle(
                                color: isSelected ? Colors.white : Colors.blue,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),

            // 🔹 Konten berdasarkan tab terpilih
            Expanded(
              child: Obx(() {
                switch (c.selectedIndex.value) {
                  case 1:
                    return MovieScreen();
                  case 2:
                    return TVScreen();
                  default:
                    return AllScreen();
                }
              }),
            ),
          ],
        ),
      ),
    );
  }
}
