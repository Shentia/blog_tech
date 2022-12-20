import 'package:blog_tech/controller/list_article_controller.dart';
import 'package:blog_tech/controller/single_article_controller.dart';
import 'package:blog_tech/view/single.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../component/my_component.dart';

// ignore: must_be_immutable
class ArticleListScreen extends StatelessWidget {
  String title;
  ArticleListScreen({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    ListArticleController listArticleController =
        Get.put(ListArticleController());

    SingleArticleController singleArticleController =
        Get.put(SingleArticleController());

    return SafeArea(
        child: Scaffold(
      appBar: appBar(textTheme, title),
      body: Obx(
        () => SizedBox(
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: listArticleController.articleList.length,
              itemBuilder: ((context, index) {
                return Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CachedNetworkImage(
                          imageUrl:
                              listArticleController.articleList[index].image!,
                          imageBuilder: (context, imageProvider) {
                            return GestureDetector(
                              onTap: (() {
                                // singleArticleController.id.value = int.parse(
                                //     listArticleController
                                //         .articleList[index].id);
                                // singleArticleController.getArticleInfo(id);
                                //TODO bejaye ID listArticleController.articleList[index].id mizaqrim

                                singleArticleController.getArticleInfo(
                                    listArticleController
                                        .articleList[index].id);
                              }),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: Get.size.width / 3,
                                  height: Get.size.width / 3,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover),
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: const Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          placeholder: (context, url) {
                            return const Loading();
                          },
                          errorWidget: (context, url, error) {
                            return const Icon(
                              Icons.image_not_supported_outlined,
                              color: Colors.grey,
                              size: 50,
                            );
                          }),
                      const SizedBox(width: 20),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: Get.width / 2,
                            child: Text(
                              listArticleController.articleList[index].title!,
                              textAlign: TextAlign.end,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                listArticleController.articleList[index].view!,
                                style: textTheme.bodyText2,
                              ),
                              const SizedBox(
                                width: 20,
                                height: 30,
                              ),
                              Text(
                                listArticleController
                                    .articleList[index].author!,
                                style: textTheme.bodyText2,
                              ),
                            ],
                          ),
                        ],
                      )
                    ]);
              })),
        ),
      ),
    ));
  }
}
