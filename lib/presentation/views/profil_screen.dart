import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tmdb_app/core/constants/image_assets.dart';
import 'package:tmdb_app/presentation/components/bottomsheet_dialog_pengaturan_akun.dart';
import 'package:tmdb_app/presentation/controllers/auth_controller.dart';
import 'package:tmdb_app/presentation/controllers/lastwatch_controller.dart';

class ProfilScreen extends StatefulWidget {
  const ProfilScreen({super.key});

  @override
  State<ProfilScreen> createState() => _ProfilScreenState();
}

class _ProfilScreenState extends State<ProfilScreen> {
  final LastwatchController lastwatchController =
      Get.find<LastwatchController>();
  final AuthController authController = Get.find<AuthController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLastwatch();
    getUserLogin();
  }

  Future<void> getLastwatch() async {
    await lastwatchController.loadLastWatch();
  }

  String name = "";
  String email = "";

  Future<void> getUserLogin() async {
    final prefs = await SharedPreferences.getInstance();
    final email = prefs.getString("user_email");
    final name = prefs.getString("user_name");

    if (email != null && name != null) {
      setState(() {
        this.name = name;
        this.email = email;
      });
    }
    print("INI NAMA $name");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(() {
          if (lastwatchController.lastwatch.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(
                      ImageAssets.emoji,
                      width: 64,
                      height: 64,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    name,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(
                    email,
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Bergabung sejak November 2023",
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  SizedBox(height: 12),
                  SizedBox(
                    width: 32,
                    height: 32,
                    child: Material(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                        side: BorderSide(color: Colors.grey.shade300),
                      ),
                      color: const Color.fromARGB(255, 250, 250, 250),
                      child: InkWell(
                        onTap: () {
                          showLogoutBottomSheet(context, authController);
                        },
                        borderRadius: BorderRadius.circular(100),
                        child: Center(
                          child: Icon(Icons.more_horiz, color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
          return Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset(
                        ImageAssets.emoji,
                        width: 64,
                        height: 64,
                      ),
                    ),
                    SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          email,
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Bergabung sejak November 2023",
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: SizedBox(
                          width: 32,
                          height: 32,
                          child: Material(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                              side: BorderSide(color: Colors.grey.shade300),
                            ),
                            color: const Color.fromARGB(255, 250, 250, 250),
                            child: InkWell(
                              onTap: () {
                                showLogoutBottomSheet(context, authController);
                              },
                              borderRadius: BorderRadius.circular(100),
                              child: Center(
                                child: Icon(
                                  Icons.more_horiz,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24),
                Text(
                  "Terakhir Dilihat",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, // 👉 dua kolom
                          crossAxisSpacing: 12, // jarak antar kolom
                          mainAxisSpacing: 12, // jarak antar baris
                          childAspectRatio:
                              2 /
                              3, // rasio lebar vs tinggi (2:3 biar proporsional)
                        ),
                    itemCount: lastwatchController.lastwatch.length,
                    itemBuilder: (context, index) {
                      final item = lastwatchController.lastwatch[index];
                      final rating = item.voteAverage != null
                          ? (item.voteAverage * 10).toInt()
                          : 0;

                      return Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.network(
                              'https://image.tmdb.org/t/p/w500${item.posterPath}',
                              width: double.infinity,
                              height: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            left: 8,
                            bottom: 8,
                            child: Material(
                              borderRadius: BorderRadius.circular(100),
                              elevation: 0,
                              color: Colors.amber,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 6,
                                  vertical: 3,
                                ),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      color: Colors.brown,
                                      size: 12,
                                    ),
                                    Text(
                                      "$rating%",
                                      style: const TextStyle(
                                        color: Colors.brown,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
