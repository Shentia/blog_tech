import 'package:blog_tech/gen/assets.gen.dart';
import 'package:blog_tech/screen/home-screen.dart';
import 'package:blog_tech/screen/profile-screen.dart';
import 'package:flutter/material.dart';
import '../colors.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var selectedPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    var size = MediaQuery.of(context).size;
    double bodyMargin = size.width / 10;

    List<Widget> techMainScreenPages = [
      homeScreen(size: size, textTheme: textTheme, bodyMargin: bodyMargin),
      profileScreen(size: size, textTheme: textTheme, bodyMargin: bodyMargin),
    ];

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
            Center(
              child: Positioned.fill(
                child: techMainScreenPages[selectedPageIndex],
              ),
            ),
            ButtomNavigation(size: size, bodyMargin: bodyMargin),
          ],
        ),
      ),
    );
  }
}

class ButtomNavigation extends StatelessWidget {
  const ButtomNavigation({
    Key? key,
    required this.size,
    required this.bodyMargin,
  }) : super(key: key);

  final Size size;
  final double bodyMargin;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 10,
      right: 0,
      left: 0,
      child: Container(
        height: size.height / 17,
        decoration: const BoxDecoration(
          gradient: GradientColors.bottomNavigationBackground,
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(bodyMargin, 0, bodyMargin, 0),
          child: Container(
            height: size.height / 7,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
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
    );
  }
}