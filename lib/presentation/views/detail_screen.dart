import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tmdb_app/core/constants/color_assets.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
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
                    Image.network(
                      'https://image.tmdb.org/t/p/w500/8Y43POKjjKDGI9MH89NW0NAzzp8.jpg',
                      width: double.infinity,
                      height: 390,
                      fit: BoxFit.cover,
                    ),

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
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
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
                          Column(
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
                        ],
                      ),
                      SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
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
                          Column(
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
                        ],
                      ),
                      SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
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
                          Column(
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
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 16,
                                      ),
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
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
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
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(24),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Text("Status", style: TextStyle(fontSize: 10)),
                              Text("Rilis", style: TextStyle(fontSize: 12)),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "Bahasa Ucapan",
                                style: TextStyle(fontSize: 10),
                              ),
                              Text("Inggris", style: TextStyle(fontSize: 12)),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Text("Anggaran", style: TextStyle(fontSize: 10)),
                              Text(
                                '\$195,000,000.00',
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text("Pemasukan", style: TextStyle(fontSize: 10)),
                              Text(
                                "\$200,714,058.00",
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
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
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 16,
                                    ),
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
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
