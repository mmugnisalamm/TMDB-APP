import 'package:get/get.dart';
import 'package:flutter/material.dart';

class TrendingController extends GetxController {
  var selectedIndex = 0.obs;

  void changeTab(int index) {
    selectedIndex.value = index;
  }
}
