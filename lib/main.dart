
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpapers_getx_assign/view/main_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(WallPapersAssign());
}


class WallPapersAssign extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "FinPaisa",
      defaultTransition: Transition.rightToLeft,
      home:  MainScreen(),
    );
  }
  
}