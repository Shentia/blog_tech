import 'package:flutter/material.dart';
import '../strings.dart';

import '../colors.dart';
import '../models/fake_data.dart';

// ignore: camel_case_types
class homeScreen extends StatelessWidget {
  const homeScreen({
    Key? key,
    required this.size,
    required this.textTheme,
    required this.bodyMargin,
  }) : super(key: key);

  final Size size;
  final TextTheme textTheme;
  final double bodyMargin;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
        child: Column(
          children: [
            HomePagePoster(size: size, textTheme: textTheme),
            const SizedBox(height: 8),
            HomePageTagList(bodyMargin: bodyMargin, textTheme: textTheme),
            const SizedBox(height: 28),
            HomePageSeeMore(bodyMargin: bodyMargin, textTheme: textTheme),
            HomePageBlogList(
                size: size, bodyMargin: bodyMargin, textTheme: textTheme),
            HomePageSeeMorePodcast(
                bodyMargin: bodyMargin, textTheme: textTheme),
            HomePagePodastList(size: size, bodyMargin: bodyMargin),
            const SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}

class HomePagePodastList extends StatelessWidget {
  const HomePagePodastList({
    Key? key,
    required this.size,
    required this.bodyMargin,
  }) : super(key: key);

  final Size size;
  final double bodyMargin;

  @override
  Widget build(BuildContext context) {
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
                                image:
                                    NetworkImage(podcastList[index].imageURL),
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
                      podcastList[index].title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            );
          })),
          itemCount: podcastList.length),
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

class HomePageBlogList extends StatelessWidget {
  const HomePageBlogList({
    Key? key,
    required this.size,
    required this.bodyMargin,
    required this.textTheme,
  }) : super(key: key);

  final Size size;
  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
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
                                image: NetworkImage(blogList[index].imageURL),
                                fit: BoxFit.cover),
                          ),
                          foregroundDecoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            gradient: GradientColors.bannerCoverGradient,
                          ),
                        ),
                        Positioned(
                          left: 0,
                          right: 0,
                          bottom: 20,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                blogList[index].author,
                                style: textTheme.subtitle1,
                              ),
                              Row(
                                children: [
                                  const Icon(Icons.remove_red_eye_outlined,
                                      color: SolidColors.posterTitle, size: 16),
                                  const SizedBox(width: 4),
                                  Text(
                                    blogList[index].views,
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
                        blogList[index].title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      )),
                ],
              ),
            );
          })),
          itemCount: blogList.length),
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

class HomePageTagList extends StatelessWidget {
  const HomePageTagList({
    Key? key,
    required this.bodyMargin,
    required this.textTheme,
  }) : super(key: key);

  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
          //In khaili bahal bod
          scrollDirection: Axis.horizontal,
          itemBuilder: ((context, index) {
            return Padding(
              padding:
                  EdgeInsets.fromLTRB(index == 0 ? bodyMargin : 10, 8, 0, 0),
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  gradient: GradientColors.hashtagGradient,
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                  child: Row(
                    children: [
                      const Icon(Icons.collections_bookmark_outlined,
                          color: Colors.white),
                      Center(
                        child: Text(hashtag[index].title,
                            style: textTheme.headline1),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
          itemCount: hashtag.length),
    );
  }
}

class HomePagePoster extends StatelessWidget {
  const HomePagePoster({
    Key? key,
    required this.size,
    required this.textTheme,
  }) : super(key: key);

  final Size size;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: size.width / 1.2,
          height: size.height / 4.2,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            image: DecorationImage(
                image: AssetImage(FakeDataMap["imgUrl"]), fit: BoxFit.cover),
          ),
          foregroundDecoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            gradient: GradientColors.bannerCoverGradient,
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
                    FakeDataMap["author"] + " " + FakeDataMap["date"],
                    style: textTheme.subtitle1,
                  ),
                  Row(
                    children: [
                      const Icon(Icons.remove_red_eye_outlined,
                          color: SolidColors.posterTitle, size: 16),
                      const SizedBox(width: 4),
                      Text(
                        FakeDataMap["viewCount"],
                        style: textTheme.subtitle1,
                      ),
                    ],
                  ),
                ],
              ),
              Text(
                FakeDataMap["description"],
                style: textTheme.headline1,
              ),
            ],
          ),
        )
      ],
    );
  }
}
