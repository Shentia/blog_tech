import 'package:blog_tech/component/my_component.dart';
import 'package:blog_tech/gen/assets.gen.dart';
import 'package:blog_tech/services/dio_service.dart';
import 'package:blog_tech/view/home-screen.dart';
import 'package:blog_tech/view/profile-screen.dart';
import 'package:blog_tech/component/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:share_plus/share_plus.dart';
import '../component/colors.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

final GlobalKey<ScaffoldState> _key = GlobalKey();

class HomeScreen extends StatelessWidget {
  RxInt selectedPageIndex = 0.obs;

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    double bodyMargin = size.width / 10;

    // List<Widget> techMainScreenPages = [
    //   homeScreen(size: size, textTheme: textTheme, bodyMargin: bodyMargin),
    //   profileScreen(size: size, textTheme: textTheme, bodyMargin: bodyMargin),
    // ];

    return SafeArea(
      child: Scaffold(
        key: _key,
        drawer: Drawer(
          backgroundColor: SolidColors.scaffold,
          child: Padding(
            padding: EdgeInsets.only(right: bodyMargin, left: bodyMargin),
            child: ListView(
              children: [
                DrawerHeader(
                  child: Center(
                    child: Image.asset(
                      Assets.images.splash.path,
                      scale: 3,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    Strings.profile,
                    style: textTheme.headline4,
                  ),
                  onTap: () {},
                ),
                const Divider(color: SolidColors.divider),
                ListTile(
                  title: Text(
                    Strings.about,
                    style: textTheme.headline4,
                  ),
                  onTap: () {},
                ),
                const Divider(color: SolidColors.divider),
                ListTile(
                  title: Text(
                    Strings.shareTechBlog,
                    style: textTheme.headline4,
                  ),
                  onTap: () async {
                    await Share.share(Strings.shareText);
                  },
                ),
                const Divider(color: SolidColors.divider),
                ListTile(
                  title: Text(
                    Strings.github,
                    style: textTheme.headline4,
                  ),
                  onTap: () {
                    lunchUrlLink(Strings.githubUrl);
                  },
                ),
                const Divider(color: SolidColors.divider),
              ],
            ),
          ),
        ),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: SolidColors.scaffold,
          title: Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    _key.currentState?.openDrawer();
                  },
                  child: const Icon(
                    Icons.menu,
                    color: SolidColors.scaffoldIcon,
                  ),
                ),
                Image(
                  image: AssetImage(Assets.images.splash.path),
                  height: size.height / 13.6,
                ),
                const Icon(
                  Icons.search,
                  color: SolidColors.scaffoldIcon,
                ),
              ],
            ),
          ),
        ),
        body: Stack(
          children: [
            Positioned.fill(
                child: Obx(
              () => IndexedStack(
                index: selectedPageIndex.value,
                children: [
                  homeScreen(
                      size: size, textTheme: textTheme, bodyMargin: bodyMargin),
                  profileScreen(
                      size: size, textTheme: textTheme, bodyMargin: bodyMargin),
                ],
              ),
            )),
            ButtomNavigation(
              size: size,
              bodyMargin: bodyMargin,
              changeMainScreen: (int value) {
                selectedPageIndex.value = value;
              },
            ),
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
    required this.changeMainScreen,
  }) : super(key: key);

  final Size size;
  final double bodyMargin;
  final Function(int) changeMainScreen;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 8,
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
                  onPressed: (() => changeMainScreen(0)),
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
                  onPressed: (() => changeMainScreen(1)),
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
