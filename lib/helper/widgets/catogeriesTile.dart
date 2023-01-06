import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/main_page_controller.dart';

class CatogeriesTile extends StatelessWidget {
 

  CatogeriesTile(
      {Key? key})
      : super(key: key);

  final mainPageController = Get.put(MainPageController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        itemCount: mainPageController.catModel.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              mainPageController.selectedCategory.value = index;
              mainPageController.getCategoriesWallpaper(categoryName: mainPageController.catModel[index].catogeriesName!);
            },
            child: Container(
              margin: const EdgeInsets.only(right: 8),
              child: 
                 Stack(
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: kIsWeb
                                ? Image.network(
                                    mainPageController.catModel[index].catogeriesUrl!,
                                    height: 50,
                                    width: 100,
                                    fit: BoxFit.cover,
                                  )
                                : CachedNetworkImage(
                                    imageUrl: mainPageController.catModel[index].catogeriesUrl!,
                                    height: 50,
                                    width: 100,
                                    fit: BoxFit.cover,
                                  )),
                        Obx(() => Container(
                          height: 50,
                          width: 100,
                          decoration: BoxDecoration(
                              color: mainPageController.selectedCategory == index ? Colors.red : Colors.black54,
                              borderRadius: BorderRadius.circular(8)),
                        ),),
                        Container(
                          height: 50,
                          width: 100,
                          alignment: Alignment.center,
                          child: Text(
                            mainPageController.catModel[index].catogeriesName!,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
            ),
          );
          // return CatogeriesTile(
          //   catogeriesName:
          //       mainPageController.catModel[index].catogeriesName,
          //   imageUrl: mainPageController.catModel[index].catogeriesUrl,
          // );
        },
      ),
    );
  }
}
