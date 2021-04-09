import 'package:blogging/app/api.dart/api.dart';
import 'package:blogging/app/models/publication.dart';
import 'package:blogging/app/ui/android/menu_pages/menu_controller.dart';
import 'package:blogging/app/util/format_data.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class HomeController extends GetxController {
  MenuController controllerMenu = Get.find();
  Api api = Api();

  Rx<Publication> publication = Publication().obs;
  Publication get getPublication => publication.value;

  RxList<Publication> listPublication = <Publication>[].obs;
  List<Publication> get getListPublication => listPublication;
  setPublication(newValue) => listPublication.add(newValue);

  void getListPost() async {
    List<Map<String, dynamic>> data = [await api.getPublication()];
    data.forEach((element) {
      element['Result'].forEach((data) {
        Publication publication = Publication.fromJson(data);
        setPublication(publication);
      });
    });
  }

  String formatData(String data) {
    int convertData = int.tryParse(data);
    DateTime dataCurrent =
        DateTime.fromMicrosecondsSinceEpoch(convertData * 1000);

    String newDataCurrent = FormatDataCustom.formatData(dataCurrent.toString());
    return newDataCurrent;
  }

  String formatHours(String hour) {
    int converHour = int.tryParse(hour);
    DateTime hourCurrent =
        DateTime.fromMicrosecondsSinceEpoch(converHour * 1000);

    String newHourCurrent = FormatDataCustom.formatHour(hourCurrent.toString());

    return newHourCurrent;
  }

  String verifyTextLength(String text) {
    if (text.length <= 280) {
      return text;
    } else {
      String newText = text.substring(0, 281) + "...";
      return newText;
    }
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    getListPost();
  }
}
