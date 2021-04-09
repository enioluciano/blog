import 'package:blogging/app/ui/android/menu_pages/menu_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuPages extends GetView<MenuController> {
  @override
  Widget build(BuildContext context) {
    print(Get.isDarkMode);
    return Scaffold(
        appBar: AppBar(
          title: Text("Seja Bem-vindo"),
          centerTitle: true,
          actions: [
            IconButton(
                icon: Icon(Icons.nightlight_round),
                onPressed: () {
                  controller.dark();
                })
          ],
        ),
        body: Navigator(
          key: Get.nestedKey(1),
          initialRoute: '/publication',
          onGenerateRoute: controller.onGenerateRoute,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Get.isDarkMode ? Colors.grey : null,
          onPressed: () {
            showDialogAddItem();
          },
          child: Icon(
            Icons.add,
            color: Get.isDarkMode ? Colors.white : null,
          ),
          elevation: 2.0,
        ),
        bottomNavigationBar: BottomAppBar(
          notchMargin: 2.0,
          shape: CircularNotchedRectangle(),
          clipBehavior: Clip.antiAlias,
          child: SizedBox(
            child: Obx(
              () => BottomNavigationBar(
                backgroundColor:
                    Get.isDarkMode ? Colors.black : Colors.grey[200],
                type: BottomNavigationBarType.fixed,
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Publicações',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.portrait_sharp,
                    ),
                    label: 'Meus Posts',
                  ),
                ],
                currentIndex: controller.selectedTab.value,
                selectedItemColor:
                    Get.isDarkMode ? Colors.red : Colors.blue[300],
                onTap: controller.changePage,
              ),
            ),
          ),
        ));
  }

  showDialogAddItem() {
    Get.defaultDialog(
        title: "",
        titleStyle: TextStyle(fontSize: 17),
        content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
          return Card(
            color: Colors.grey[100],
            shadowColor: Colors.transparent,
            elevation: 0,
            child: Container(
              color: Get.isDarkMode ? Colors.grey[400] : null,
              child: TextFormField(
                cursorColor: Get.isDarkMode ? Colors.grey[400] : null,
                maxLines: 6,
                keyboardType: TextInputType.text,
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(
                    fillColor: Colors.blue,
                    contentPadding: EdgeInsets.only(left: 10, top: 10),
                    hintText: "Escreva sua publicação aqui...",
                    hintStyle: TextStyle(
                        fontSize: 13,
                        color: Get.isDarkMode ? Colors.black : null),
                    border: InputBorder.none),
                onChanged: (String name) {},
              ),
            ),
          );
        }),
        barrierDismissible: false,
        textConfirm: "Publicar",
        buttonColor: Get.isDarkMode ? Colors.grey[300] : Colors.white,
        confirmTextColor: Colors.green,
        textCancel: "Cancelar",
        cancelTextColor: Colors.red,
        onConfirm: () {},
        onCancel: () => Get.back());
  }
}
