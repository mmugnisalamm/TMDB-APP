import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/nav_controller.dart';

class FloatingNavBar extends StatelessWidget {
  const FloatingNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final NavController controller = Get.find<NavController>();

    final List<IconData> icons = [
      Icons.home_rounded,
      Icons.bookmark_added_rounded,
      Icons.person_outline_rounded,
    ];

    final List<String> labels = ["Beranda", "Watchlist", "Profil"];

    return Obx(() {
      return SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: FractionallySizedBox(
              widthFactor:
                  0.6, // 👈 ubah angka ini untuk memperkecil/memperlebar (0.85 = 85% lebar layar)
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(icons.length, (index) {
                    final isSelected = controller.selectedIndex.value == index;

                    return GestureDetector(
                      onTap: () => controller.changeIndex(index),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 250),
                        curve: Curves.easeInOut,
                        padding: EdgeInsets.symmetric(
                          horizontal: isSelected ? 16 : 0,
                          vertical: 12,
                        ),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? Colors.indigo
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              icons[index],
                              color: isSelected
                                  ? Colors.white
                                  : Colors.grey.shade700,
                              size: 20,
                            ),
                            if (isSelected) ...[
                              const SizedBox(width: 8),
                              Text(
                                labels[index],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
