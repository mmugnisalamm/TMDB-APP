import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tmdb_app/core/constants/color_assets.dart';
import 'package:tmdb_app/core/utils/db_helper.dart';
import 'package:tmdb_app/core/utils/formatter.dart';
import 'package:tmdb_app/data/models/watchlist_model.dart';
import 'package:tmdb_app/presentation/components/shimmer.dart';
import 'package:tmdb_app/presentation/controllers/lastwatch_controller.dart';
import 'package:tmdb_app/presentation/controllers/movie_detail_controller.dart';
import 'package:tmdb_app/presentation/controllers/tv_detail_controller.dart';
import 'package:tmdb_app/presentation/controllers/watchlist_controller.dart';

class MovieDetailScreen extends StatefulWidget {
  const MovieDetailScreen({super.key});

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  var movieDetailController = Get.find<MovieDetailController>();
  var tvDetailController = Get.find<TvDetailController>();
  var watchlistController = Get.find<WatchlistController>();
  var lastwatchController = Get.find<LastwatchController>();
  String mediaType = "";
  bool isWathclist = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final params = Get.parameters;
    final id = int.parse(params['id'] ?? '0');
    initFunc(id);
  }

  Future<void> initFunc(int id) async {
    await movieDetailController.fetchMovieDetail(id);
    await movieDetailController.fetchMovieRating(id);
    await movieDetailController.fetchMovieReviews(id);
    await watchlistController.checkIsInWatchlist(
      movieDetailController.movieDetail.value?.title ?? "NO TITLE",
    );
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
                      if (movieDetailController.isLoading.value) {
                        return Center(child: ShimmerPosterDetail());
                      }
                      return Image.network(
                        'https://image.tmdb.org/t/p/w200${movieDetailController.movieDetail.value?.posterPath}',
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
                          Obx(() {
                            return AnimatedOpacity(
                              opacity:
                                  movieDetailController
                                          .movieDetail
                                          .value
                                          ?.title ==
                                      ""
                                  ? 0.0
                                  : 1.0,
                              duration: Duration(milliseconds: 10),
                              child: Text(
                                movieDetailController
                                        .movieDetail
                                        .value
                                        ?.title ??
                                    "NO TITLE",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            );
                          }),
                          const SizedBox(height: 4),
                          Obx(() {
                            return AnimatedOpacity(
                              opacity:
                                  movieDetailController
                                          .movieDetail
                                          .value
                                          ?.genre ==
                                      ""
                                  ? 0.0
                                  : 1.0,
                              duration: Duration(milliseconds: 10),
                              child: Text(
                                movieDetailController
                                        .movieDetail
                                        .value
                                        ?.genre ??
                                    "NO GENRE",
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 12,
                                ),
                              ),
                            );
                          }),
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
                                child: Obx(() {
                                  return AnimatedOpacity(
                                    opacity:
                                        movieDetailController
                                                .certificationLabel
                                                .value ==
                                            ""
                                        ? 0.0
                                        : 1.0,
                                    duration: Duration(milliseconds: 10),
                                    child: Text(
                                      movieDetailController
                                          .certificationLabel
                                          .value,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                      ),
                                    ),
                                  );
                                }),
                              ),
                              const SizedBox(width: 8),
                              Obx(() {
                                return AnimatedOpacity(
                                  opacity: movieDetailController.isLoading.value
                                      ? 0.0
                                      : 1.0,
                                  duration: Duration(milliseconds: 10),
                                  child: Text(
                                    "${movieDetailController.movieDetail.value?.releaseDate} (${movieDetailController.movieDetail.value?.originalLanguage.toUpperCase()})",
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 12,
                                    ),
                                  ),
                                );
                              }),
                              const SizedBox(width: 5),
                              const Icon(
                                Icons.circle,
                                color: Colors.white,
                                size: 5,
                              ),
                              const SizedBox(width: 5),
                              Obx(() {
                                return AnimatedOpacity(
                                  opacity: movieDetailController.isLoading.value
                                      ? 0.0
                                      : 1.0,
                                  duration: Duration(milliseconds: 10),
                                  child: Text(
                                    Formatter().formatRuntime(
                                      movieDetailController
                                              .movieDetail
                                              .value
                                              ?.runtime ??
                                          0,
                                    ),
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 12,
                                    ),
                                  ),
                                );
                              }),
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
                                child: InkWell(
                                  onTap: () async {
                                    await lastwatchController.addLastWatch(
                                      WatchlistModel(
                                        id:
                                            movieDetailController
                                                .movieDetail
                                                .value
                                                ?.id ??
                                            0,
                                        posterPath:
                                            movieDetailController
                                                .movieDetail
                                                .value
                                                ?.posterPath ??
                                            "/",
                                        backdropPath:
                                            movieDetailController
                                                .movieDetail
                                                .value
                                                ?.backdropPath ??
                                            "/",
                                        overview:
                                            movieDetailController
                                                .movieDetail
                                                .value
                                                ?.overview ??
                                            "NO OVERVIEW",
                                        name:
                                            movieDetailController
                                                .movieDetail
                                                .value
                                                ?.title ??
                                            "NO TITLE",
                                        voteAverage:
                                            movieDetailController
                                                .movieDetail
                                                .value
                                                ?.voteAverage ??
                                            0,
                                      ),
                                    );
                                    // ignore: use_build_context_synchronously
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          "Membuka Trailer ${movieDetailController.movieDetail.value?.title ?? "NO TITLE"}",
                                        ),
                                      ),
                                    );
                                  },
                                  borderRadius: BorderRadius.circular(100),
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
                              ),
                              SizedBox(width: 8),
                              Obx(() {
                                final isWatchlist =
                                    watchlistController.isWatchlist.value;

                                return Material(
                                  color: const Color.fromARGB(
                                    71,
                                    158,
                                    158,
                                    158,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: InkWell(
                                    onTap: () async {
                                      if (isWatchlist) {
                                        // Jika sudah di watchlist → hapus
                                        await watchlistController
                                            .removeFromWatchlist(
                                              movieDetailController
                                                      .movieDetail
                                                      .value
                                                      ?.id ??
                                                  0,
                                            );
                                      } else {
                                        // Jika belum di watchlist → tambahkan
                                        await watchlistController
                                            .addToWatchlist(
                                              WatchlistModel(
                                                id:
                                                    movieDetailController
                                                        .movieDetail
                                                        .value
                                                        ?.id ??
                                                    0,
                                                posterPath:
                                                    movieDetailController
                                                        .movieDetail
                                                        .value
                                                        ?.posterPath ??
                                                    "/",
                                                backdropPath:
                                                    movieDetailController
                                                        .movieDetail
                                                        .value
                                                        ?.backdropPath ??
                                                    "/",
                                                overview:
                                                    movieDetailController
                                                        .movieDetail
                                                        .value
                                                        ?.overview ??
                                                    "NO OVERVIEW",
                                                name:
                                                    movieDetailController
                                                        .movieDetail
                                                        .value
                                                        ?.title ??
                                                    "NO TITLE",
                                                voteAverage:
                                                    movieDetailController
                                                        .movieDetail
                                                        .value
                                                        ?.voteAverage ??
                                                    0,
                                              ),
                                            );
                                      }
                                    },
                                    borderRadius: BorderRadius.circular(100),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Row(
                                        children: [
                                          Icon(
                                            isWatchlist
                                                ? Icons.check_circle
                                                : Icons.add,
                                            size: 16,
                                            color: isWatchlist
                                                ? Colors.green
                                                : Colors.white,
                                          ),
                                          const SizedBox(width: 5),
                                          Text(
                                            "Watchlist",
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }),
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
                                  child: Obx(() {
                                    return AnimatedOpacity(
                                      opacity:
                                          movieDetailController.isLoading.value
                                          ? 0.0
                                          : 1.0,
                                      duration: Duration(milliseconds: 10),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: Colors.brown,
                                            size: 16,
                                          ),
                                          SizedBox(width: 5),
                                          Text(
                                            "${movieDetailController.movieDetail.value?.voteAverage != null ? ((movieDetailController.movieDetail.value?.voteAverage ?? 0) * 10).toInt() : 0}%",
                                            style: TextStyle(
                                              color: Colors.brown,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }),
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
                      Obx(() {
                        return AnimatedOpacity(
                          opacity: movieDetailController.isLoading.value
                              ? 0.0
                              : 1.0,
                          duration: Duration(milliseconds: 10),
                          child: Text(
                            movieDetailController.movieDetail.value?.overview ??
                                "NO OVERVIEW",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: const Color.fromARGB(255, 90, 90, 90),
                            ),
                            softWrap: true,
                            textAlign: TextAlign.justify,
                          ),
                        );
                      }),
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
                      Obx(() {
                        final limitedList = movieDetailController
                            .movieDetail
                            .value
                            ?.casts
                            .take(5)
                            .toList();
                        return AnimatedOpacity(
                          opacity: movieDetailController.isLoading.value
                              ? 0.0
                              : 1.0,
                          duration: Duration(milliseconds: 10),
                          child: SizedBox(
                            height: 194, // tinggi total konten (gambar + teks)
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemCount: limitedList?.length ?? 0,
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(16),
                                            topRight: Radius.circular(16),
                                          ),
                                          child: Image.network(
                                            'https://image.tmdb.org/t/p/w500${limitedList?[index].profilePath}',
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
                                            limitedList?[index].name ??
                                                "NO NAME",
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            softWrap: true,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        SizedBox(height: 4),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 12,
                                          ),
                                          child: Text(
                                            limitedList?[index].character ??
                                                limitedList?[index].job ??
                                                "NO ROLE",
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.grey,
                                            ),
                                            softWrap: true,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
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
                        );
                      }),
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
                              children: [
                                Text("Status", style: TextStyle(fontSize: 10)),
                                Obx(() {
                                  return AnimatedOpacity(
                                    opacity:
                                        movieDetailController.isLoading.value
                                        ? 0.0
                                        : 1.0,
                                    duration: Duration(milliseconds: 10),
                                    child: Text(
                                      movieDetailController
                                              .movieDetail
                                              .value
                                              ?.status ??
                                          "",
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  );
                                }),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Bahasa Ucapan",
                                  style: TextStyle(fontSize: 10),
                                ),
                                Obx(() {
                                  return AnimatedOpacity(
                                    opacity:
                                        movieDetailController.isLoading.value
                                        ? 0.0
                                        : 1.0,
                                    duration: Duration(milliseconds: 10),
                                    child: Text(
                                      movieDetailController
                                              .movieDetail
                                              .value
                                              ?.language ??
                                          "",
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  );
                                }),
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
                              children: [
                                Text(
                                  "Anggaran",
                                  style: TextStyle(fontSize: 10),
                                ),
                                Obx(() {
                                  return AnimatedOpacity(
                                    opacity:
                                        movieDetailController.isLoading.value
                                        ? 0.0
                                        : 1.0,
                                    duration: Duration(milliseconds: 10),
                                    child: Text(
                                      "\$${movieDetailController.movieDetail.value?.budget}",
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  );
                                }),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Pemasukan",
                                  style: TextStyle(fontSize: 10),
                                ),
                                Obx(() {
                                  return AnimatedOpacity(
                                    opacity:
                                        movieDetailController.isLoading.value
                                        ? 0.0
                                        : 1.0,
                                    duration: Duration(milliseconds: 10),
                                    child: Text(
                                      "\$${movieDetailController.movieDetail.value?.revenue}",
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  );
                                }),
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
                    Obx(() {
                      if (movieDetailController.isLoadingCast.value) {
                        return Center(child: CircularProgressIndicator());
                      }
                      if (movieDetailController.reviews.isEmpty) {
                        return Center(
                          child: Text(
                            "No Review",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        );
                      }
                      final item = movieDetailController.reviews;
                      return AnimatedOpacity(
                        opacity: movieDetailController.reviews.isEmpty
                            ? 0.0
                            : 1.0,
                        duration: Duration(milliseconds: 10),
                        child: SizedBox(
                          height: 278, // tinggi total konten (gambar + teks)
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: item.length,
                            separatorBuilder: (context, index) =>
                                const SizedBox(width: 8), // jarak antar item
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            itemBuilder: (context, index) {
                              return SizedBox(
                                width: 278,
                                child: Material(
                                  color: const Color.fromARGB(
                                    255,
                                    255,
                                    253,
                                    248,
                                  ),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                                  item[index].author
                                                      .substring(1)
                                                      .toString()
                                                      .toUpperCase(),
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
                                                  item[index].username,
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Text(
                                                  item[index].createdAt
                                                      .toString(),
                                                  style: TextStyle(
                                                    fontSize: 10,
                                                  ),
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
                                                padding:
                                                    const EdgeInsets.symmetric(
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
                                                      item[index].rating == null
                                                          ? "0"
                                                          : item[index].rating
                                                                .toString(),
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
                                          item[index].content,
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
                                          maxLines: 12,
                                          overflow: TextOverflow.ellipsis,
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
                      );
                    }),
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
