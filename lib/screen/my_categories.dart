import 'package:blog_tech/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../strings.dart';

class MyCategories extends StatelessWidget {
  const MyCategories({super.key});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    double bodyMargin = MediaQuery.of(context).size.width / 10;
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(right: bodyMargin, left: bodyMargin),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  Assets.images.discord.path,
                  height: 75,
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  Strings.successRegisterd,
                  style: textTheme.headline5,
                ),
                const SizedBox(
                  height: 16,
                ),
                TextField(
                  textAlign: TextAlign.center,
                  autofocus: true,
                  decoration: InputDecoration(
                    hintText: Strings.firstAndLastName,
                    alignLabelWithHint: true,
                    hintStyle: textTheme.headline4,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  Strings.favCategory,
                  style: textTheme.headline5,
                ),
              ],
            ),
          ),
        ),
      ),
    )));
  }
}
