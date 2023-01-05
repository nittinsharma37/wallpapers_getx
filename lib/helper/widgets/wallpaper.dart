


import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../model/photosModel.dart';

Widget wallPaper(
    {required List<PhotosModel> wallPhoto, required BuildContext context}) {
      Orientation orientation = MediaQuery.of(context).orientation;
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16),
    child: GridView.count(
        crossAxisCount: orientation == Orientation.portrait ? 2: 3,
        childAspectRatio: 0.6,
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        padding: const EdgeInsets.all(4.0),
        mainAxisSpacing: 6.0,
        crossAxisSpacing: 6.0,
        children: wallPhoto.map((PhotosModel photoModel) {
          return GridTile(
              child: GestureDetector(
            onTap: () {
              // Navigator.push(context, MaterialPageRoute(builder: (context) {
              //   return ImageView(
              //     imgUrl: photoModel.src!.portrait!,
              //   );
              // }));
            },
            child: Hero(
              tag: photoModel.src!.portrait!,
              child: Container(
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: kIsWeb
                        ? Image.network(
                            photoModel.src!.portrait!,
                            height: 50,
                            width: 100,
                            fit: BoxFit.cover,
                          )
                        : CachedNetworkImage(
                            imageUrl: photoModel.src!.portrait!,
                            placeholder: (context, url) => Container(
                                  color: Color(0xfff5f8fd),
                                ),
                            fit: BoxFit.cover)),
              ),
            ),
          ));
        }).toList()),
  );
}
