import 'package:blog_tech/component/my_component.dart';
import 'package:blog_tech/controller/single_article_controller.dart';
import 'package:blog_tech/gen/assets.gen.dart';
import 'package:blog_tech/view/article_list_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import '../component/colors.dart';
import '../controller/list_article_controller.dart';

class Single extends StatelessWidget {
  SingleArticleController singleArticleController =
      Get.put(SingleArticleController());

  Single({super.key});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    // var id = Get.arguments[0];
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Obx(
          // ignore: unnecessary_null_comparison
          () => singleArticleController.articleInfoModel.value.title == null
              ? SizedBox(
                  height: Get.height,
                  child: const Loading(),
                )
              : Column(
                  children: [
                    Stack(
                      children: [
                        CachedNetworkImage(
                          imageUrl: singleArticleController
                              .articleInfoModel.value.image!,
                          imageBuilder: (context, imageProvider) {
                            return Image(
                                image: imageProvider, fit: BoxFit.cover);
                          },
                          placeholder: ((context, url) => const Loading()),
                          errorWidget: (context, url, error) => const Icon(
                            Icons.image_not_supported_outlined,
                            size: 50,
                            color: SolidColors.title,
                          ),
                        ),
                        Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            height: 60,
                            decoration: const BoxDecoration(
                              gradient: GradientColors.singleArticleBanner,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                const SizedBox(
                                  width: 20,
                                ),
                                IconButton(
                                  onPressed: (() {
                                    Get.back();
                                  }),
                                  icon: const Icon(
                                    Icons.arrow_back_ios,
                                    color: Colors.white,
                                  ),
                                ),
                                const Expanded(child: SizedBox()),
                                IconButton(
                                  onPressed: (() {
                                    //TODO
                                  }),
                                  icon: const Icon(
                                    Icons.favorite_border,
                                    color: Colors.white,
                                  ),
                                ),
                                IconButton(
                                  onPressed: (() {
                                    //TODO
                                  }),
                                  icon: const Icon(
                                    Icons.share,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        singleArticleController.articleInfoModel.value.title!,
                        maxLines: 2,
                        style: textTheme.headline5,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Image(
                            image:
                                Image.asset(Assets.images.profile.path).image,
                            width: 50,
                            height: 50,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(singleArticleController
                              .articleInfoModel.value.author!),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            singleArticleController
                                .articleInfoModel.value.createdAt!,
                            style: textTheme.caption,
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: HtmlWidget(
                          singleArticleController
                              .articleInfoModel.value.content!,
                          textStyle: textTheme.caption,
                          enableCaching: true,
                          onLoadingBuilder:
                              (context, element, loadingProgress) =>
                                  const Loading()),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    tags(textTheme),
                    relatedNews(textTheme),
                  ],
                ),
        ),
      ),
    ));
  }

  Widget tags(textTheme) {
    return SizedBox(
      height: 35,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: singleArticleController.tagsList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () async {
              var tagId = singleArticleController.tagsList[index].id;
              await Get.find<ListArticleController>()
                  .getArticleListWithTagsId(tagId);
              String tagName = singleArticleController.tagsList[index].title;
              Get.to(ArticleListScreen(title: tagName));
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Container(
                height: 30,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  color: Colors.grey,
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                  child: Text(
                    singleArticleController.tagsList[index].title,
                    style: textTheme.caption,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget relatedNews(textheme) {
    return SizedBox(
      height: Get.height / 3.5,
      child: ListView.builder(
          itemCount: singleArticleController.relatedArticleList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: ((context, index) {
            //blog item
            return GestureDetector(
              onTap: (() {
                singleArticleController.getArticleInfo(
                    singleArticleController.relatedArticleList[index].id);
              }),
              child: Padding(
                padding:
                    EdgeInsets.only(right: index == 0 ? Get.width / 15 : 15),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: Get.height / 5.3,
                        width: Get.width / 2.4,
                        child: Stack(
                          children: [
                            CachedNetworkImage(
                              imageUrl: singleArticleController
                                  .relatedArticleList[index].image!,
                              imageBuilder: ((context, imageProvider) =>
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(16)),
                                      image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.cover),
                                    ),
                                    foregroundDecoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(16)),
                                        gradient:
                                            GradientColors.bannerCoverGradient),
                                  )),
                              placeholder: ((context, url) => const Loading()),
                              errorWidget: ((context, url, error) => const Icon(
                                    Icons.image_not_supported_outlined,
                                    size: 50,
                                    color: Colors.grey,
                                  )),
                            ),
                            Positioned(
                              bottom: 8,
                              left: 0,
                              right: 0,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    singleArticleController
                                        .relatedArticleList[index].author!,
                                    style: textheme.subtitle1,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        singleArticleController
                                            .relatedArticleList[index].view!,
                                        style: textheme.subtitle1,
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      const Icon(
                                        Icons.remove_red_eye_sharp,
                                        color: Colors.white,
                                        size: 16,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                        width: Get.width / 2.4,
                        child: Text(
                          singleArticleController
                              .relatedArticleList[index].title!,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ))
                  ],
                ),
              ),
            );
          })),
    );
  }
}
