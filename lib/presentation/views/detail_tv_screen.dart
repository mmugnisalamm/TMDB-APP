import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tmdb_app/core/constants/color_assets.dart';
import 'package:tmdb_app/presentation/components/shimmer.dart';
import 'package:tmdb_app/presentation/controllers/movie_detail_controller.dart';
import 'package:tmdb_app/presentation/controllers/tv_detail_controller.dart';

class TvDetailScreen extends StatefulWidget {
  const TvDetailScreen({super.key});

  @override
  State<TvDetailScreen> createState() => _TvDetailScreenState();
}

class _TvDetailScreenState extends State<TvDetailScreen> {
  var tvDetailController = Get.find<TvDetailController>();
  String mediaType = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final params = Get.parameters;
    final id = int.parse(params['id'] ?? '0');
    tvDetailController.fetchTvDetail(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Obx(() {
                      if (tvDetailController.isLoading.value) {
                        return Center(child: ShimmerPosterDetail());
                      }
                      return Image.network(
                        'https://image.tmdb.org/t/p/w200${tvDetailController.tvDetail.value?.posterPath}',
                        width: double.infinity,
                        height: 390,
                        fit: BoxFit.cover,
                      );
                    }),

                    Container(
                      height: 390,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black.withOpacity(0.7),
                          ],
                        ),
                      ),
                    ),

                    Positioned(
                      bottom: 16, // jarak dari bawah
                      left: 16,
                      right: 16,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "TITLE MOVIE",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "Drama, Kejahatan, Cinta, Seru",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 6,
                                  vertical: 2,
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.transparent,
                                ),
                                child: const Text(
                                  "R",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              const Text(
                                "15/12/2023 (ID)",
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 12,
                                ),
                              ),
                              const SizedBox(width: 5),
                              const Icon(
                                Icons.circle,
                                color: Colors.white,
                                size: 5,
                              ),
                              const SizedBox(width: 5),
                              const Text(
                                "2 jam 18 menit",
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Material(
                                color: ColorAsset.primaryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadiusGeometry.circular(
                                    100,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.play_arrow,
                                        size: 16,
                                        color: Colors.white,
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        "Lihat Trailer",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(width: 8),
                              Material(
                                color: const Color.fromARGB(71, 158, 158, 158),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadiusGeometry.circular(
                                    100,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.add,
                                        size: 16,
                                        color: Colors.white,
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        "Watchlist",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(width: 8),
                              Material(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadiusGeometry.circular(
                                    100,
                                  ),
                                ),
                                color: Colors.amber,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.brown,
                                        size: 16,
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        "90%",
                                        style: TextStyle(
                                          color: Colors.brown,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Gambaran Umum",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "While struggling with his dual identity, Arthur Fleck not only stumbles upon true love, but also finds the music that's always been inside him.",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: const Color.fromARGB(255, 90, 90, 90),
                        ),
                        softWrap: true,
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Divider(
                    color: const Color.fromARGB(255, 90, 90, 90),
                    height: 0,
                    thickness: 0.5,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Director, Writer",
                                  style: TextStyle(fontSize: 10),
                                ),
                                Text(
                                  "Todd Phillips",
                                  style: TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Director, Writer",
                                  style: TextStyle(fontSize: 10),
                                ),
                                Text(
                                  "Todd Phillips",
                                  style: TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Director, Writer",
                                  style: TextStyle(fontSize: 10),
                                ),
                                Text(
                                  "Todd Phillips",
                                  style: TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Director, Writer",
                                  style: TextStyle(fontSize: 10),
                                ),
                                Text(
                                  "Todd Phillips",
                                  style: TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Director, Writer",
                                  style: TextStyle(fontSize: 10),
                                ),
                                Text(
                                  "Todd Phillips",
                                  style: TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Director, Writer",
                                  style: TextStyle(fontSize: 10),
                                ),
                                Text(
                                  "Todd Phillips",
                                  style: TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  color: const Color.fromARGB(255, 243, 243, 243),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 24,
                          left: 24,
                          right: 24,
                        ),
                        child: Row(
                          children: [
                            Text(
                              "Pemain & Kru",
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
                        height: 194, // tinggi total konten (gambar + teks)
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          separatorBuilder: (context, index) =>
                              const SizedBox(width: 8), // jarak antar item
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          itemBuilder: (context, index) {
                            return SizedBox(
                              width: 140,
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
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(16),
                                        topRight: Radius.circular(16),
                                      ),
                                      child: Image.network(
                                        'https://image.tmdb.org/t/p/w500/8Y43POKjjKDGI9MH89NW0NAzzp8.jpg',
                                        width: 140,
                                        height: 140,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 12,
                                      ),
                                      child: Text(
                                        "Title $index",
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 12,
                                      ),
                                      child: Text(
                                        "Description",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 24),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text("Status", style: TextStyle(fontSize: 10)),
                                Text("Rilis", style: TextStyle(fontSize: 12)),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  "Bahasa Ucapan",
                                  style: TextStyle(fontSize: 10),
                                ),
                                Text("Inggris", style: TextStyle(fontSize: 12)),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  "Anggaran",
                                  style: TextStyle(fontSize: 10),
                                ),
                                Text(
                                  "\$195,000,000.00",
                                  style: TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  "Pemasukan",
                                  style: TextStyle(fontSize: 10),
                                ),
                                Text(
                                  "\$200,714,058.00",
                                  style: TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 24,
                        left: 24,
                        right: 24,
                      ),
                      child: Text(
                        "Ulasan",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
                    SizedBox(
                      height: 278, // tinggi total konten (gambar + teks)
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        separatorBuilder: (context, index) =>
                            const SizedBox(width: 8), // jarak antar item
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        itemBuilder: (context, index) {
                          return SizedBox(
                            width: 278,
                            child: Material(
                              color: const Color.fromARGB(255, 255, 253, 248),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                                side: BorderSide(
                                  color: const Color.fromARGB(
                                    255,
                                    255,
                                    249,
                                    233,
                                  ),
                                  width: 1,
                                ), // ⬅️ border
                              ),
                              elevation: 0,
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          width: 36,
                                          height: 36,
                                          decoration: BoxDecoration(
                                            color: ColorAsset.primaryColor,
                                            borderRadius:
                                                BorderRadiusGeometry.circular(
                                                  100,
                                                ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              "T",
                                              style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 12),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "austinmgray",
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              "25 November 2023",
                                              style: TextStyle(fontSize: 10),
                                            ),
                                          ],
                                        ),
                                        Expanded(child: SizedBox()),
                                        Material(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadiusGeometry.circular(
                                                  100,
                                                ),
                                          ),
                                          color: Colors.amber,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 4,
                                              horizontal: 6,
                                            ),
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.star,
                                                  color: Colors.brown,
                                                  size: 12,
                                                ),
                                                SizedBox(width: 5),
                                                Text(
                                                  "8.0",
                                                  style: TextStyle(
                                                    color: Colors.brown,
                                                    fontSize: 12,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 12),
                                    Text(
                                      "one of the best installments to the Hunger Games series. it’s definitely the darkest and most political entry to the saga. act III could have been more fleshed out, but it doesn’t detract from the story the film is telling. act III was the most compelling segments in aspects of Coriolanus Snow’s villain origins. \n\nif you're a fan of political dramas or a character study or just a huge fan of the Hunger Games series, this is the film for you. excellent casting, excellent music, and deliciously evil performances.",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: const Color.fromARGB(
                                          255,
                                          160,
                                          160,
                                          160,
                                        ),
                                      ),
                                      softWrap: true,
                                      textAlign: TextAlign.justify,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 24),
                  ],
                ),

                SizedBox(height: 70),
              ],
            ),
          ),
          Positioned(
            left: 20,
            top: 40,
            child: SizedBox(
              height: 40,
              width: 40,
              child: FloatingActionButton(
                onPressed: () {
                  Get.back();
                },
                backgroundColor: const Color.fromARGB(88, 158, 158, 158),
                child: Center(
                  child: Icon(
                    Icons.arrow_back_sharp,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(100),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
