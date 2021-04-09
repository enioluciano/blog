import 'package:blogging/app/ui/android/home/home.dart';
import 'package:blogging/app/ui/android/home/home_binding.dart';
import 'package:blogging/app/ui/android/home/home_controller.dart';
import 'package:blogging/app/ui/android/menu_pages/menu.dart';
import 'package:blogging/app/ui/android/menu_pages/menu_binding.dart';
import 'package:blogging/app/ui/android/my_posts/my_posts.dart';
import 'package:blogging/app/ui/android/my_posts/my_posts_binding.dart';

import 'package:get/get.dart';

import 'routes.dart';

class AppPages {
  static final routes = [
    GetPage(
        name: Routes.INITIAL,
        page: () => MenuPages(),
        transition: Transition.zoom,
        binding: MenuBinding()),
    GetPage(name: Routes.HOME, page: () => Home(), binding: HomeBinding()),
    GetPage(
        name: Routes.MYPOSTS, page: () => MyPosts(), binding: MyPostBinding()),
  ];
}
