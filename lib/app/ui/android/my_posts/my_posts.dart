import 'package:blogging/app/models/publication.dart';
import 'package:blogging/app/ui/android/home/home_controller.dart';
import 'package:blogging/app/ui/android/my_posts/my_posts_controllerr.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyPosts extends GetView<MyPostsController> {
  final HomeController homeController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Obx(() => ListView.builder(
          itemCount: homeController.getListPublication.length,
          itemBuilder: (context, index) {
            if (index == 1) {
              Publication userPost = homeController.getListPublication[index];
              return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Card(
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ListTile(
                                    horizontalTitleGap: 0,
                                    contentPadding: EdgeInsets.only(right: 0),
                                    dense: true,
                                    visualDensity: VisualDensity.compact,
                                    leading: ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
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
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 15),
                                            ),
                                            SizedBox(
                                              height: 2,
                                            ),
                                            Text(
                                              homeController.formatData(
                                                  userPost.dataHora),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w400,
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
                                  Text(homeController
                                      .verifyTextLength(userPost.texto)),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      ElevatedButton(
                                          style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      Colors.red)),
                                          onPressed: () {},
                                          child: Icon(Icons.delete_forever)),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      ElevatedButton(
                                          style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      Colors.yellow[700])),
                                          onPressed: () {},
                                          child: Icon(Icons.edit)),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                ])))
                  ]);
            }
            return Container();
          })),
    );
  }
}
