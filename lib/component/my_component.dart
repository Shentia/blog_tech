import 'package:blog_tech/controller/home_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:url_launcher/url_launcher.dart';
import 'colors.dart';

// ignore: camel_case_types
class profileDevider extends StatelessWidget {
  const profileDevider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Divider(
      thickness: 0.5,
      color: SolidColors.divider,
      indent: 20.0,
      endIndent: 20.0,
    );
  }
}

class MainTags extends StatelessWidget {
  MainTags({
    Key? key,
    required this.textTheme,
    required this.index,
  }) : super(key: key);

  final TextTheme textTheme;
  var index;
  @override
  Widget build(BuildContext context) {
    return Container(
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
              child: Text(
                  Get.find<HomeScreenController>().tagsList[index].title,
                  style: textTheme.headline1),
            ),
          ],
        ),
      ),
    );
  }
}

lunchUrlLink(String url) async {
  var uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    throw 'Could not launch $uri';
  }
}

class Loading extends StatelessWidget {
  const Loading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SpinKitFadingCube(
      color: SolidColors.primaryColor,
      size: 32.0,
    );
  }
}

PreferredSize appBar(TextTheme textTheme, String title) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(80),
    child: Padding(
      padding: const EdgeInsets.all(12.0),
      child: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Center(
              child: Text(
                title,
                style: textTheme.headline6,
              ),
            ),
          ),
        ],
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                color: SolidColors.primaryColor.withBlue(100),
                shape: BoxShape.circle),
            child: IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Colors.white,
                  size: 20,
                )),
          ),
        ),
      ),
    ),
  );
}
