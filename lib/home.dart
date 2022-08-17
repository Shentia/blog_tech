import 'package:blog_tech/gen/assets.gen.dart';
import 'package:blog_tech/models/fake_data.dart';
import 'package:blog_tech/strings.dart';
import 'package:flutter/material.dart';
import 'colors.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    var size = MediaQuery.of(context).size;
    double bodyMargin = size.width / 10;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: solidColors.scaffold,
          title: Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Icon(
                  Icons.menu,
                  color: solidColors.scaffoldIcon,
                ),
                Image(
                  image: AssetImage(Assets.images.splash.path),
                  height: size.height / 13.6,
                ),
                const Icon(
                  Icons.search,
                  color: solidColors.scaffoldIcon,
                ),
              ],
            ),
          ),
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: size.width / 1.2,
                          height: size.height / 4.2,
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(16)),
                            image: DecorationImage(
                                image: AssetImage(FakeDataMap["imgUrl"]),
                                fit: BoxFit.cover),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    FakeDataMap["author"] +
                                        " " +
                                        FakeDataMap["date"],
                                    style: textTheme.subtitle1,
                                  ),
                                  Row(
                                    children: [
                                      const Icon(Icons.remove_red_eye_outlined,
                                          color: solidColors.posterTitle,
                                          size: 16),
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
                    ),

                    //List of Hashtag
                    const SizedBox(height: 8),
                    SizedBox(
                      height: 50,
                      child: ListView.builder(
                          //In khaili bahal bod
                          scrollDirection: Axis.horizontal,
                          itemBuilder: ((context, index) {
                            return Padding(
                              padding: EdgeInsets.fromLTRB(
                                  index == 0 ? bodyMargin : 10, 8, 0, 0),
                              child: Container(
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  gradient: GradientColors.hashtagGradient,
                                ),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(8, 0, 8, 0),
                                  child: Row(
                                    children: [
                                      const Icon(
                                          Icons.collections_bookmark_outlined,
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
                    ),
                    const SizedBox(height: 28),
                    Padding(
                      padding: EdgeInsets.only(left: bodyMargin, bottom: 8),
                      child: Row(
                        children: [
                          const Icon(Icons.note_alt_outlined,
                              color: solidColors.moreArticles, size: 24),
                          const SizedBox(width: 8),
                          Text(Strings.hotNews, style: textTheme.headline3),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height / 3.5,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (((context, index) {
                            return Padding(
                              padding: EdgeInsets.only(
                                  left: index == 0 ? bodyMargin : 15),
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
                                                const BorderRadius.all(
                                                    Radius.circular(15)),
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    blogList[index].imageURL),
                                                fit: BoxFit.cover),
                                          ),
                                          foregroundDecoration:
                                              const BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(15)),
                                            gradient: GradientColors
                                                .bannerCoverGradient,
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
                                                blogList[index].author,
                                                style: textTheme.subtitle1,
                                              ),
                                              Row(
                                                children: [
                                                  const Icon(
                                                      Icons
                                                          .remove_red_eye_outlined,
                                                      color: solidColors
                                                          .posterTitle,
                                                      size: 16),
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
                    ),

                    //podcasts

                    Padding(
                      padding: EdgeInsets.only(left: bodyMargin, bottom: 8),
                      child: Row(
                        children: [
                          const Icon(Icons.podcasts,
                              color: solidColors.moreArticles, size: 24),
                          const SizedBox(width: 8),
                          Text(Strings.hotPod, style: textTheme.headline3),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height / 3.5,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (((context, index) {
                            return Padding(
                              padding: EdgeInsets.only(
                                  left: index == 0 ? bodyMargin : 15),
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
                                                const BorderRadius.all(
                                                    Radius.circular(15)),
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    podcastList[index]
                                                        .imageURL),
                                                fit: BoxFit.cover),
                                          ),
                                          foregroundDecoration:
                                              const BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(15)),
                                            gradient: GradientColors
                                                .bannerCoverGradient,
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
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                height: size.height / 10,
                decoration: const BoxDecoration(
                  gradient: GradientColors.bottomNavigationBackground,
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                  child: Container(
                    height: size.height / 7,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      gradient: GradientColors.bottomNav,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                          onPressed: (() {}),
                          icon: const Icon(
                            Icons.home,
                            color: Colors.white,
                          ),
                        ),
                        IconButton(
                          onPressed: (() {}),
                          icon: const Icon(
                            Icons.podcasts,
                            color: Colors.white,
                          ),
                        ),
                        IconButton(
                          onPressed: (() {}),
                          icon: const Icon(
                            Icons.person,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
