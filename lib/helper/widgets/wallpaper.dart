


import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../model/photosModel.dart';

Widget wallPaper(
    {required List wallPhoto, required BuildContext context}) {
      Orientation orientation = MediaQuery.of(context).orientation;
  return Container(
    // padding: EdgeInsets.symmetric(horizontal: 16),
    child: GridView.builder(
      gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 6.0,
        crossAxisSpacing: 6.0,
         crossAxisCount: orientation == Orientation.portrait ? 3: 3,
      ),
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        padding: const EdgeInsets.all(4.0),
        
        itemCount: wallPhoto.length,
      itemBuilder: ((context, index) => GridTile(
              child: GestureDetector(
            onTap: () {
              
            },
            child: Hero(
              tag: wallPhoto[index]['src']['tiny'],
              child: Container(
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: kIsWeb
                        ? Image.network(
                            wallPhoto[index]['src']['tiny'],
                            height: 50,
                            width: 100,
                            fit: BoxFit.cover,
                          )
                        : CachedNetworkImage(
                            imageUrl: wallPhoto[index]['src']['tiny'],
                            placeholder: (context, url) => Container(
                                  color: Color(0xfff5f8fd),
                                ),
                            fit: BoxFit.cover)),
              ),
            ),
          ))),
        ),
  );
}
