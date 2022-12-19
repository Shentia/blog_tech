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

class Single extends StatefulWidget {
  const Single({super.key});

  @override
  State<Single> createState() => _SingleState();
}

class _SingleState extends State<Single> {
  SingleArticleController singleArticleController =
      Get.put(SingleArticleController());

  @override
  void initState() {
    super.initState();
    singleArticleController.getArticleInfo();
  }

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    // var id = Get.arguments[0];
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Obx(
          () => Column(
            children: [
              Stack(
                children: [
                  CachedNetworkImage(
                    imageUrl:
                        singleArticleController.articleInfoModel.value.image!,
                    imageBuilder: (context, imageProvider) {
                      return Image(image: imageProvider, fit: BoxFit.cover);
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
                        gradient: GradientColors.bannerCoverGradient,
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
                      image: Image.asset(Assets.images.profile.path).image,
                      width: 50,
                      height: 50,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                        singleArticleController.articleInfoModel.value.author!),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      singleArticleController.articleInfoModel.value.createdAt!,
                      style: textTheme.caption,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: HtmlWidget(
                    singleArticleController.articleInfoModel.value.content!,
                    textStyle: textTheme.caption,
                    enableCaching: true,
                    onLoadingBuilder: (context, element, loadingProgress) =>
                        const Loading()),
              ),
              const SizedBox(
                height: 30,
              ),
              tags(textTheme),
            ],
          ),
        ),
      ),
    ));
  }

  Widget tags(textTheme) {
    return SizedBox(
      height: 25,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: singleArticleController.tagsList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () async {
              var tagId = singleArticleController.tagsList[index].id;
              await Get.find<ListArticleController>()
                  .getArticleListWithTagsId(tagId);
              Get.to(const ArticleListScreen());
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 30,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(24)),
                  color: Colors.grey,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    singleArticleController.tagsList[index].title,
                    style: textTheme.headline3,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
