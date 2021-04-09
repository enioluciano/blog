import 'package:blogging/app/ui/android/menu_pages/menu_controller.dart';
import 'package:get/get.dart';

class MenuBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => MenuController());
  }
}
