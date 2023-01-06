import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpapers_getx_assign/helper/widgets/search_widget.dart';

import '../controller/main_page_controller.dart';
import '../helper/widgets/catogeriesTile.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);

  final mainPageController = Get.put(MainPageController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Wallpapers",
          style: TextStyle(color: Colors.black87),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          searchWidget(context, mainPageController.searchImageController, mainController: mainPageController, onTap: (){
            mainPageController.getSearchWallpaper();
          }),
          const SizedBox(
            height: 20,
          ),
          CatogeriesTile(),
          Expanded(
            child: Obx(() => mainPageController.photos.isEmpty
                ? SizedBox(
                    height: MediaQuery.of(context).size.height * 0.80,
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),)
                : NotificationListener<ScrollNotification>(
                    onNotification: (notification) {
                      return mainPageController
                          .handleScrollNotification(notification);
                    },
                    child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisSpacing: 6.0,
                        crossAxisSpacing: 6.0,
                        crossAxisCount: 3,
                      ),
                      controller: mainPageController.controller,
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(4.0),
                      itemCount: mainPageController.photos.length,
                      itemBuilder: ((context, index) => GridTile(
                              child: GestureDetector(
                            onTap: () {
                              // Navigator.push(context, MaterialPageRoute(builder: (context) {
                              //   return ImageView(
                              //     imgUrl: photoModel.src!.portrait!,
                              //   );
                              // }));
                            },
                            child: Hero(
                              tag: mainPageController.photos[index]['src']
                                  ['tiny'],
                              child: Container(
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(16),
                                    child: kIsWeb
                                        ? Image.network(
                                            mainPageController.photos[index]
                                                ['src']['tiny'],
                                            height: 50,
                                            width: 100,
                                            fit: BoxFit.cover,
                                          )
                                        : CachedNetworkImage(
                                            imageUrl: mainPageController
                                                .photos[index]['src']['tiny'],
                                            placeholder: (context, url) =>
                                                Container(
                                                  color: Color(0xfff5f8fd),
                                                ),
                                            fit: BoxFit.cover)),
                              ),
                            ),
                          ))),
                    ),
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
