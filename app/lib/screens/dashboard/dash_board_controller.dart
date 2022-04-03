import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashBoardScreenController extends GetxController {
  var selectedIndex = 0.obs; //New

  void onItemTapped(int index) {
    selectedIndex.value = index;
    update();
  }

  //New
  static const List<Widget> pages = <Widget>[
    Icon(
      Icons.call,
      size: 150,
    ),
    Icon(
      Icons.camera,
      size: 150,
    ),
    Icon(
      Icons.chat,
      size: 150,
    ),
  ];
}
