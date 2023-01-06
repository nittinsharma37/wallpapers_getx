import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:gallery_saver/gallery_saver.dart';

import '../controller/main_page_controller.dart';

class ImageView extends StatelessWidget {
  final String imgUrl;

  ImageView({Key? key, required this.imgUrl}) : super(key: key);

  final mainPageController = Get.put(MainPageController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;
    Orientation orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Wallpaper"),
        actions: [
          IconButton(
            onPressed: () {
              mainPageController.savePhoto(imageUrl: imgUrl);
            },
            icon: const Icon(Icons.file_download),
          ),
        ],
      ),
      body: Hero(
        tag: imgUrl,
        child: CachedNetworkImage(
          progressIndicatorBuilder: ((context, url, progress) => Center(
                child: CircularProgressIndicator(
                  value: progress.progress,
                ),
              )),
          imageUrl: imgUrl,
          fit: BoxFit.cover,
          height: _screenSize.height,
          width: _screenSize.width,
        ),
      ),
    );
  }
}
