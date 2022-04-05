import 'package:get/get.dart';

class DashBoardScreenController extends GetxController {
  var selectedIndex = 0.obs; //New

  void onItemTapped(int index) {
    selectedIndex.value = index;
    print('=====xxx selected index is $index');
    update();
  }

  //New

}
