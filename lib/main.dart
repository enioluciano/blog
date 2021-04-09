import 'package:blogging/app/ui/android/menu_pages/menu.dart';
import 'package:blogging/app/ui/android/menu_pages/menu_binding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/routes/app_pages.dart';
import 'app/routes/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Blog',
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        themeMode: ThemeMode.light,
        home: MenuPages(),
        initialBinding: MenuBinding(),
        initialRoute: Routes.INITIAL,
        getPages: AppPages.routes);
  }
}
