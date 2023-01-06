import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/catogeriesModel.dart';
import '../model/photosModel.dart';
import '../services/static_data.dart';

import 'package:http/http.dart' as http;

class MainPageController extends GetxController
    with GetTickerProviderStateMixin {
  final TextEditingController searchImageController = TextEditingController();
  late TabController _tabController2;

  List<CatogeriesModel> catModel = [];

  RxList photos = [].obs;
  RxInt selectedCategory = 0.obs;
  RxInt noOfPage = 1.obs;

  late ScrollController controller;

  getCategoriesWallpaper({required String categoryName}) async {
    if (categoryName == "All") {
      photos.clear();
      await getTrendingWallpaper();
    } else {

      photos.clear();
      await http.get(
          Uri.parse(
              '''https://api.pexels.com/v1/search?query=${categoryName}&per_page=24&page=$noOfPage'''),
          headers: {"Authorization": apiKey}).then((value) {
        print(value.statusCode);

        Map<String, dynamic> jsonData = jsonDecode(value.body);
        print(jsonData);
        photos.addAll(jsonData['photos']);
        print(photos);
        print(photos.length);
      });

    }
  }

  getSearchWallpaper() async {
    print("text field value ---- ${searchImageController.text}");
    if (searchImageController.text.length == 0) {
      photos.clear();
      await getTrendingWallpaper();
    } else {
      photos.clear();
      await http.get(
          Uri.parse(
              '''https://api.pexels.com/v1/search?query=${searchImageController.text}&per_page=24&page=$noOfPage'''),
          headers: {"Authorization": apiKey}).then((value) {
        print(value.statusCode);

        Map<String, dynamic> jsonData = jsonDecode(value.body);
        print(jsonData);
        photos.addAll(jsonData['photos']);
        print(photos);
        print(photos.length);
      });
    }
  }

  getTrendingWallpaper() async {
    await http.get(
        Uri.parse(
            '''https://api.pexels.com/v1/curated?query${searchImageController.text}=per_page=24&page=$noOfPage'''),
        headers: {"Authorization": apiKey}).then((value) {
      print(value.statusCode);

      Map<String, dynamic> jsonData = jsonDecode(value.body);
      print(jsonData);
      photos.addAll(jsonData['photos']);
      print(photos);
      print(photos.length);
    });
  }

  bool handleScrollNotification(ScrollNotification notification) {
    if (notification is ScrollEndNotification) {
      if (controller.position.extentAfter == 0) {
        print("have to load more");
        noOfPage.value++;
        getTrendingWallpaper();
      }
    }
    return false;
  }

  /// The `onInit()` function is called when the `State` is first created
  @override
  void onInit() {
    super.onInit();
    getTrendingWallpaper();
    controller = ScrollController();

    _tabController2 = TabController(length: 8, vsync: this);
    catModel = getCatogeries();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
    _tabController2.dispose();
  }
}
