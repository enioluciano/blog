import 'package:blogging/app/ui/android/home/home.dart';
import 'package:blogging/app/ui/android/home/home_binding.dart';

import 'package:blogging/app/ui/android/my_posts/my_posts.dart';
import 'package:blogging/app/ui/android/my_posts/my_posts_binding.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuController extends GetxController {
  static MenuController get to => Get.find();
  Rx<Color> color = Colors.grey.obs;
  set setColor(newColor) => color.value = newColor;

  RxInt selectedTab = 0.obs;
  int get getSelectedTab => selectedTab.value;
  setSelectedTab(newValue) => selectedTab.value = newValue;

  var pages = <String>[
    "/publication",
    "/myposts",
  ];
  void changePage(int index) {
    selectedTab.value = index;
    Get.toNamed(pages[index], id: 1);
  }

  void dark() {
    Get.changeTheme(Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
  }

  Route onGenerateRoute(RouteSettings settings) {
    if (settings.name == '/publication')
      return GetPageRoute(
        settings: settings,
        page: () => Home(),
        binding: HomeBinding(),
      );

    if (settings.name == '/myposts')
      return GetPageRoute(
        settings: settings,
        page: () => MyPosts(),
        binding: MyPostBinding(),
      );

    return null;
  }
}
