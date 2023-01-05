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

  RxList<PhotosModel> photos = <PhotosModel>[].obs;

  RxInt noOfPage = 1.obs;

  late ScrollController controller;

  getTrendingWallpaper() async {
    await http.get(
        Uri.parse(
            "https://api.pexels.com/v1/curated?per_page=10&page=$noOfPage"),
        headers: {"Authorization": apiKey}).then((value) {
      print(value.statusCode);

      Map<String, dynamic> jsonData = jsonDecode(value.body);
      jsonData["photos"].forEach((element) {
        // print(element);
        PhotosModel photosModel = PhotosModel();
        photosModel = PhotosModel.fromMap(element);
        photos.add(photosModel);
      });

      print(photos);
      print(photos.length);

      update();
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
