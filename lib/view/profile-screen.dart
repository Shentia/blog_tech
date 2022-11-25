import 'package:flutter/material.dart';
import '../component/colors.dart';
import '../gen/assets.gen.dart';
import '../component/my_component.dart';
import '../component/strings.dart';

// ignore: camel_case_types
class profileScreen extends StatelessWidget {
  const profileScreen({
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
        padding: const EdgeInsets.only(top: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(Assets.images.profile.path),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.note_add, color: SolidColors.moreArticles),
                const SizedBox(width: 8),
                Text(
                  Strings.editImageProfile,
                  style: textTheme.headline3,
                )
              ],
            ),
            const SizedBox(height: 60),
            Text(
              "Ahmadreza",
              style: textTheme.headline4,
            ),
            Text(
              "email@gmail.com",
              style: textTheme.headline4,
            ),
            const SizedBox(
              height: 40,
            ),
            const profileDevider(),
            InkWell(
              splashColor: SolidColors.primaryColor,
              onTap: (() {}),
              child: SizedBox(
                height: 45,
                child: Center(
                  child: Text(
                    Strings.myFavoriteBlog,
                    style: textTheme.headline4,
                  ),
                ),
              ),
            ),
            const profileDevider(),
            InkWell(
              splashColor: SolidColors.primaryColor,
              onTap: (() {}),
              child: SizedBox(
                height: 45,
                child: Center(
                  child: Text(
                    Strings.myFavoritePodcast,
                    style: textTheme.headline4,
                  ),
                ),
              ),
            ),
            const profileDevider(),
            InkWell(
              splashColor: SolidColors.primaryColor,
              onTap: (() {}),
              child: SizedBox(
                height: 45,
                child: Center(
                  child: Text(
                    Strings.signOut,
                    style: textTheme.headline4,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 60,
            )
          ],
        ),
      ),
    );
  }
}
