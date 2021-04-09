import 'package:blogging/app/models/publication.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'home_controller.dart';

class Home extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(children: [
        Expanded(
            child: Obx(() => ListView.builder(
                itemCount: controller.getListPublication.length,
                itemBuilder: (context, index) {
                  Publication userPost = controller.getListPublication[index];

                  return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Card(
                            child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ListTile(
                                        horizontalTitleGap: 0,
                                        contentPadding:
                                            EdgeInsets.only(right: 0),
                                        dense: true,
                                        visualDensity: VisualDensity.compact,
                                        leading: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          child: Container(
                                            height: 35,
                                            width: 30,
                                            child: Image.network(
                                              userPost.autorImageUrl,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        title: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  userPost.autorNome,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 15),
                                                ),
                                                SizedBox(
                                                  height: 2,
                                                ),
                                                Text(
                                                  controller.formatData(
                                                      userPost.dataHora),
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Colors.grey[500],
                                                      fontSize: 12),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(controller
                                          .verifyTextLength(userPost.texto)),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Icon(
                                            Icons.favorite,
                                            color: Colors.red,
                                            size: 24,
                                          ),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          Icon(
                                            Icons.share,
                                            color: Colors.grey,
                                            size: 22,
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 3,
                                      ),
                                    ])))
                      ]);
                })))
      ]),
    );
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
            child: TextFormField(
              maxLines: 6,
              keyboardType: TextInputType.text,
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 10, top: 10),
                  hintText: "Escreva sua publicação aqui...",
                  hintStyle: TextStyle(fontSize: 13),
                  border: InputBorder.none),
              onChanged: (String name) {},
            ),
          );
        }),
        barrierDismissible: false,
        textConfirm: "Publicar",
        buttonColor: Colors.white,
        confirmTextColor: Colors.green,
        textCancel: "Cancelar",
        cancelTextColor: Colors.red,
        onConfirm: () {},
        onCancel: () => Get.back());
  }
}
