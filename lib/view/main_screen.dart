import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpapers_getx_assign/helper/widgets/search_widget.dart';

import '../controller/main_page_controller.dart';
import '../helper/widgets/catogeriesTile.dart';
import '../helper/widgets/wallpaper.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);

  final mainPageController = Get.put(MainPageController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          searchWidget(context, mainPageController.searchImageController),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 100,
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              itemCount: mainPageController.catModel.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return CatogeriesTile(
                  catogeriesName:
                      mainPageController.catModel[index].catogeriesName,
                  imageUrl: mainPageController.catModel[index].catogeriesUrl,
                );
              },
            ),
          ),
          Expanded(
            child: Obx(() => mainPageController.photos.isEmpty
                ? Container(
                    height: MediaQuery.of(context).size.height * 0.70,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ))
                : NotificationListener<ScrollNotification>(
                  onNotification: (notification){
                    return mainPageController.handleScrollNotification(notification);
                  },
           
                  child: ListView.builder(
                      itemCount: mainPageController.photos.length,
                      shrinkWrap: true,
                      controller: mainPageController.controller,
                      // physics: const ClampingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return wallPaper(
                            wallPhoto: mainPageController.photos, context: context);
                      }),
                )),
          ),
          SizedBox(height: screenSize.height * 0.02),
        ],
      ),
    );
  }
}


class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  late ScrollController controller;
  List<String> items = List.generate(100, (index) => 'Hello $index');

  @override
  void initState() {
    super.initState();
    controller = ScrollController()..addListener(_scrollListener);
  }

  @override
  void dispose() {
    controller.removeListener(_scrollListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scrollbar(
        child: ListView.builder(
          controller: controller,
          itemBuilder: (context, index) {
            return Text(items[index]);
          },
          itemCount: items.length,
        ),
      ),
    );
  }

  void _scrollListener() {
    print(controller.position.extentAfter);
    if (controller.position.extentAfter < 500) {
      setState(() {
        items.addAll(List.generate(42, (index) => 'Inserted $index'));
      });
    }
  }
}