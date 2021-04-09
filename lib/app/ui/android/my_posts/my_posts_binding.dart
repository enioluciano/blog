import 'package:get/get.dart';

import 'my_posts_controllerr.dart';

class MyPostBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => MyPostsController());
  }
}
