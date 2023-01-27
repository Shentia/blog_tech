import 'package:blog_tech/controller/home_screen_controller.dart';
import 'package:blog_tech/controller/single_article_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../component/my_component.dart';
import '../component/strings.dart';
import '../component/colors.dart';

// ignore: camel_case_types, must_be_immutable
class homeScreen extends StatelessWidget {
  homeScreen({
    Key? key,
    required this.size,
    required this.textTheme,
    required this.bodyMargin,
  }) : super(key: key);

  HomeScreenController homeScreenController = Get.put(HomeScreenController());
  SingleArticleController singleArticleController =
      Get.put(SingleArticleController());

  final Size size;
  final TextTheme textTheme;
  final double bodyMargin;

  @override
  Widget build(BuildContext context) {
    // homeScreenController.getHomeItems();
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Obx(
        () => Padding(
          padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
          child: homeScreenController.loading.value == false
              ? Column(
                  children: [
                    posters(),
                    const SizedBox(height: 8),
                    topTagsList(),
                    const SizedBox(height: 28),
                    HomePageSeeMore(
                        bodyMargin: bodyMargin, textTheme: textTheme),
                    topVisited(),
                    HomePageSeeMorePodcast(
                        bodyMargin: bodyMargin, textTheme: textTheme),
                    topPodcastList(),
                    const SizedBox(
                      height: 50,
                    )
                  ],
                )
              : const Loading(),
        ),
      ),
    );
  }

  Widget topVisited() {
    return SizedBox(
      height: size.height / 3.5,
      child: Obx(
        () => ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (((context, index) {
              return GestureDetector(
                onTap: (() {
                  Get.find<SingleArticleController>().getArticleInfo(
                      homeScreenController.topVisitedList[index].id);
                }),
                child: Padding(
                  padding: EdgeInsets.only(left: index == 0 ? bodyMargin : 15),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: SizedBox(
                          height: size.height / 4.9,
                          width: size.width / 2.1,
                          child: Stack(children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(15)),
                                image: DecorationImage(
                                    image: NetworkImage(homeScreenController
                                        .topVisitedList[index].image!),
                                    fit: BoxFit.cover),
                              ),
                              foregroundDecoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                gradient: GradientColors.bannerCoverGradient,
                              ),
                            ),
                            Positioned(
                              left: 0,
                              right: 0,
                              bottom: 20,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    homeScreenController
                                        .topVisitedList[index].author!,
                                    style: textTheme.subtitle1,
                                  ),
                                  Row(
                                    children: [
                                      const Icon(Icons.remove_red_eye_outlined,
                                          color: SolidColors.posterTitle,
                                          size: 16),
                                      const SizedBox(width: 4),
                                      Text(
                                        homeScreenController
                                            .topVisitedList[index].view!,
                                        style: textTheme.subtitle1,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ]),
                        ),
                      ),
                      SizedBox(
                          width: size.width / 2.4,
                          child: Text(
                            homeScreenController.topVisitedList[index].title!,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          )),
                    ],
                  ),
                ),
              );
            })),
            itemCount: homeScreenController.topVisitedList.length),
      ),
    );
  }

  Widget topTagsList() {
    return SizedBox(
      height: 50,
      child: Obx(
        () => ListView.builder(
            //In khaili bahal bod
            scrollDirection: Axis.horizontal,
            itemBuilder: ((context, index) {
              return GestureDetector(
                onTap: () => Get.find<SingleArticleController>()
                    .getArticleInfo(homeScreenController.tagsList[index].id),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                      index == 0 ? bodyMargin : 10, 8, 0, 0),
                  child: MainTags(
                    textTheme: textTheme,
                    index: index,
                  ),
                ),
              );
            }),
            itemCount: homeScreenController.tagsList.length),
      ),
    );
  }

  Widget posters() {
    return Stack(
      children: [
        Container(
          width: size.width / 1.2,
          height: size.height / 4.2,
          foregroundDecoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            gradient: GradientColors.bannerCoverGradient,
          ),
          child: CachedNetworkImage(
            imageUrl: homeScreenController.poster.value.image!,
            imageBuilder: (context, imageProvider) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                  image:
                      DecorationImage(image: imageProvider, fit: BoxFit.cover),
                ),
              );
            },
            placeholder: (context, url) => const Loading(),
            errorWidget: (context, url, error) => const Icon(
              Icons.image_not_supported_outlined,
              size: 50,
              color: SolidColors.title,
            ),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 20,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    homeScreenController.poster.value.title!,
                    style: textTheme.subtitle1,
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget topPodcastList() {
    return SizedBox(
      height: size.height / 3.5,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (((context, index) {
            return Padding(
              padding: EdgeInsets.only(left: index == 0 ? bodyMargin : 15),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: SizedBox(
                      height: size.height / 4.9,
                      width: size.width / 2.1,
                      child: Stack(children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15)),
                            image: DecorationImage(
                                image: NetworkImage(homeScreenController
                                    .topPodcastList[index].poster!),
                                fit: BoxFit.cover),
                          ),
                          foregroundDecoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            gradient: GradientColors.bannerCoverGradient,
                          ),
                        ),
                      ]),
                    ),
                  ),
                  SizedBox(
                    width: size.width / 2.4,
                    child: Text(
                      homeScreenController.topPodcastList[index].title!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            );
          })),
          itemCount: homeScreenController.topPodcastList.length),
    );
  }
}

class HomePageSeeMorePodcast extends StatelessWidget {
  const HomePageSeeMorePodcast({
    Key? key,
    required this.bodyMargin,
    required this.textTheme,
  }) : super(key: key);

  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: bodyMargin, bottom: 8),
      child: Row(
        children: [
          const Icon(Icons.podcasts, color: SolidColors.moreArticles, size: 24),
          const SizedBox(width: 8),
          Text(Strings.hotPod, style: textTheme.headline3),
        ],
      ),
    );
  }
}

class HomePageSeeMore extends StatelessWidget {
  const HomePageSeeMore({
    Key? key,
    required this.bodyMargin,
    required this.textTheme,
  }) : super(key: key);

  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: bodyMargin, bottom: 8),
      child: Row(
        children: [
          const Icon(Icons.note_alt_outlined,
              color: SolidColors.moreArticles, size: 24),
          const SizedBox(width: 8),
          Text(Strings.hotNews, style: textTheme.headline3),
        ],
      ),
    );
  }
}
