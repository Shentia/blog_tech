import 'package:blog_tech/colors.dart';
import 'package:blog_tech/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../gen/assets.gen.dart';

class RegisterIntro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
          body: Center(
              child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            Assets.images.discord.path,
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(text: Strings.welcome, style: textTheme.headline4),
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
              textStyle: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.pressed)) {
                  return const TextStyle(fontSize: 25);
                }
                return const TextStyle(fontSize: 20);
              }),
              backgroundColor: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.pressed)) {
                  return solidColors.moreArticles;
                }
                return solidColors.primaryColor;
              }),
            ),
            child: const Text("Start"),
          ),
        ],
      ))),
    );
  }
}
