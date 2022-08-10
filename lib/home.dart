import 'package:blog_tech/gen/assets.gen.dart';
import 'package:blog_tech/models/fake_data.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Icon(Icons.search),
                  Image(
                    image: AssetImage(Assets.images.splash.path),
                    height: size.height / 13.6,
                  ),
                  const Icon(Icons.menu),
                ],
              ),
              const SizedBox(height: 8),
              Stack(
                children: [
                  Container(
                    width: size.width / 1.2,
                    height: size.height / 4.2,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(16)),
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
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              FakeDataMap["author"] + " " + FakeDataMap["date"],
                              style: textTheme.subtitle1,
                            ),
                            Row(
                              children: [
                                const Icon(Icons.remove_red_eye_outlined,
                                    color: solidColors.posterTitle, size: 16),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
