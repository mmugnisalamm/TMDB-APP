import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:tmdb_app/domain/entities/movie_tv_entity.dart';
import 'package:tmdb_app/domain/usecase/movie_tv_usecase.dart';

class TrendingController extends GetxController {
  var selectedIndex = 0.obs;

  void changeTab(int index) {
    selectedIndex.value = index;
  }

  final GetMovieTVUseCase getTrendingUseCase;

  TrendingController(this.getTrendingUseCase);

  var isLoading = false.obs;
  var trendingList = <MovieTVEntity>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchTrending();
  }

  Future<void> fetchTrending() async {
    try {
      isLoading.value = true;
      trendingList.value = await getTrendingUseCase.execute();
    } catch (e) {
      print('Error: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
