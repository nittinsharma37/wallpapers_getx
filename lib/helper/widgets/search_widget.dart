import 'package:flutter/material.dart';
import 'package:wallpapers_getx_assign/controller/main_page_controller.dart';

Widget searchWidget(context, searchController, {required VoidCallback onTap, required  MainPageController mainController}) {
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
          onSubmitted: (value) {
            print(searchController.text);
            print(value);
            onTap;
          },
          textInputAction: TextInputAction.done,
          decoration: const InputDecoration(
              border: InputBorder.none, hintText: "Search Wallpapers..."),
        ),),
        InkWell(
          child: Icon(Icons.search),
          onTap: onTap
        )
      ],
    ),
  );
}
