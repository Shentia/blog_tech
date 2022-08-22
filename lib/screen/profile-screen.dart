import 'package:blog_tech/colors.dart';
import 'package:blog_tech/gen/assets.gen.dart';
import 'package:blog_tech/strings.dart';
import 'package:flutter/material.dart';

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
              const Icon(Icons.note_add, color: solidColors.moreArticles),
              const SizedBox(width: 8),
              Text(
                Strings.editImageProfile,
                style: textTheme.headline3,
              )
            ],
          )
        ],
      ),
    );
  }
}
