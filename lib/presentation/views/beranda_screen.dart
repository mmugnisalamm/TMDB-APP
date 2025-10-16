import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tmdb_app/core/constants/color_assets.dart';
import 'package:tmdb_app/core/constants/image_assets.dart';
import 'package:tmdb_app/core/utils/db_helper.dart';
import 'package:tmdb_app/presentation/controllers/trending_controller.dart';
import 'package:tmdb_app/presentation/routes/app_route.dart';

class BerandaScreen extends StatefulWidget {
  const BerandaScreen({super.key});

  @override
  State<BerandaScreen> createState() => _BerandaScreenState();
}

class _BerandaScreenState extends State<BerandaScreen> {
  final trendingController = Get.find<TrendingController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: Center(
          child: AppBar(
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.transparent,
            toolbarHeight: 120.0,
            centerTitle: true,
            title: Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RotationTransition(
                    turns: AlwaysStoppedAnimation(-15 / 360),
                    child: Image.asset(ImageAssets.tiket, width: 27),
                  ),
                  SizedBox(width: 3.5),
                  Text(
                    "TMDB",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(100),
                        onTap: () async {},
                        child: Icon(
                          Icons.notifications_none,
                          size: 30,
                          color: ColorAsset.primaryColor,
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(100),
                        onTap: () async {
                          await DBHelper().deleteDB();
                        },
                        child: Icon(
                          Icons.search_rounded,
                          size: 30,
                          color: ColorAsset.primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
            iconTheme: IconThemeData(color: Colors.black),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Text(
                        "Trending",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 4),
                      Text(
                        "Hari Ini",
                        style: TextStyle(fontSize: 13, color: Colors.grey),
                      ),
                      Expanded(
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              Get.toNamed(Routes.trending);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "Lihat Semua",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: ColorAsset.primaryColor,
                                  ),
                                ),
                                SizedBox(width: 10),
                                Icon(
                                  Icons.arrow_forward_ios_sharp,
                                  color: ColorAsset.primaryColor,
                                  size: 12,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                Obx(() {
                  if (trendingController.isLoading.value) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  final limitedList = trendingController.trendingList
                      .take(5)
                      .toList();

                  return SizedBox(
                    height: 277,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: limitedList.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 8),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemBuilder: (context, index) {
                        final item = limitedList[index];
                        final title = item.mediaType == 'movie'
                            ? item.title
                            : item.name;
                        final rating = item.voteAverage != null
                            ? (item.voteAverage * 10).toInt()
                            : 0;

                        return SizedBox(
                          width: 330, // ✅ batasi lebar tiap card
                          child: Material(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                              side: BorderSide(
                                color: Colors.grey.shade300,
                                width: 1,
                              ),
                            ),
                            elevation: 0,
                            child: InkWell(
                              onTap: () async {
                                if (item.mediaType == "movie") {
                                  Get.toNamed(
                                    Routes.movieDetail,
                                    parameters: {"id": item.id.toString()},
                                  );
                                } else {
                                  Get.toNamed(
                                    Routes.tvDetail,
                                    parameters: {"id": item.id.toString()},
                                  );
                                }
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(16),
                                        child: Image.network(
                                          'https://image.tmdb.org/t/p/w200${item.backdropPath}',
                                          width: 330,
                                          height: 185,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                      Positioned(
                                        right: 16,
                                        top: 16,
                                        child: Material(
                                          borderRadius: BorderRadius.circular(
                                            100,
                                          ),
                                          elevation: 0,
                                          color: Colors.amber,
                                          child: Padding(
                                            padding: const EdgeInsets.all(4.5),
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
                                  ),
                                  const SizedBox(height: 12),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                    ),
                                    child: Text(
                                      title ?? 'No title',
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                    ),
                                    child: Text(
                                      item.overview,
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                      ),
                                      softWrap: true, // ✅ wrap ke bawah
                                      overflow: TextOverflow.fade,
                                      maxLines: 3, // ✅ batasi maksimal 3 baris
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }),
                SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Text(
                        "Baru Rilis",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 4),
                      Text(
                        "Oktober",
                        style: TextStyle(fontSize: 13, color: Colors.grey),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "Lihat Semua",
                              style: TextStyle(
                                fontSize: 12,
                                color: ColorAsset.primaryColor,
                              ),
                            ),
                            SizedBox(width: 10),
                            Icon(
                              Icons.arrow_forward_ios_sharp,
                              color: ColorAsset.primaryColor,
                              size: 12,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                SizedBox(
                  height: 240, // tinggi total konten (gambar + teks)
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 8), // jarak antar item
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.network(
                              'https://image.tmdb.org/t/p/w500/8Y43POKjjKDGI9MH89NW0NAzzp8.jpg',
                              width: 160,
                              height: 240,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Text(
                        "Rating Tertinggi",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "Lihat Semua",
                              style: TextStyle(
                                fontSize: 12,
                                color: ColorAsset.primaryColor,
                              ),
                            ),
                            SizedBox(width: 10),
                            Icon(
                              Icons.arrow_forward_ios_sharp,
                              color: ColorAsset.primaryColor,
                              size: 12,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                SizedBox(
                  height: 260, // tinggi total konten (gambar + teks)
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 8), // jarak antar item
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    itemBuilder: (context, index) {
                      return SizedBox(
                        width: 330,
                        child: Material(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                            side: BorderSide(
                              color: Colors.grey.shade300,
                              width: 1,
                            ), // ⬅️ border
                          ),
                          elevation: 0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Image.network(
                                  'https://image.tmdb.org/t/p/w500/8Y43POKjjKDGI9MH89NW0NAzzp8.jpg',
                                  width: 330,
                                  height: 185,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(height: 12),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                child: Text(
                                  "Title $index",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(height: 4),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      "Description",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: Colors.brown,
                                          size: 12,
                                        ),
                                        Text(
                                          "90%",
                                          style: TextStyle(
                                            color: Colors.brown,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 12),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Text(
                        "Jelajahi Film & Serial TV",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  alignment:
                      Alignment.centerLeft, // Pastikan wrap mulai dari kiri
                  child: Wrap(
                    alignment:
                        WrapAlignment.start, // Memastikan wrap mulai dari kiri
                    crossAxisAlignment: WrapCrossAlignment
                        .start, // Menjaga elemen tetap di atas
                    spacing: 8, // Jarak horizontal antar button
                    runSpacing: 8, // Jarak antar baris button
                    children: [
                      for (var item in [
                        "Action",
                        "Drama",
                        "Comedy",
                        "Thriller",
                        "Sci-Fi",
                        "Romance",
                        "Horror",
                        "Fantasy",
                        "Animation",
                        "Documentary",
                        "Adventure",
                        "Mistery",
                      ])
                        SizedBox(
                          height: 34, // Atur tinggi button
                          child: OutlinedButton(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  100,
                                ), // Atur kelengkungan border
                              ),
                            ),
                            child: Text(
                              item.tr,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[800],
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),

                SizedBox(height: 80),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
