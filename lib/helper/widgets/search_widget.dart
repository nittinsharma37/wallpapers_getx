

import 'package:flutter/material.dart';

Widget searchWidget(context,searchController) {
  return Container(
    decoration: BoxDecoration(
      color: const Color(0xfffff8f8),
      borderRadius: BorderRadius.circular(30),
    ),
    margin: const EdgeInsets.symmetric(horizontal: 18),
    padding: const EdgeInsets.symmetric(horizontal: 18),
    child: Row(
      children: [
        Expanded(
            child: TextField(
              controller: searchController,
          decoration: const InputDecoration(
              border: InputBorder.none, hintText: "Search Wallpapers..."),
        )),
        InkWell(
          child: const Icon(Icons.search),
          onTap: (){
            // if(searchController.text != ""){
            //   Navigator.push(context, MaterialPageRoute(builder: (context) => SearchView(
            //     search: searchController.text,
            //   )));
            // }
          },
        )
      ],
    ),
  );
}