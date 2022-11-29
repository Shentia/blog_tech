import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'colors.dart';
import '../models/fake_data.dart';

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
              child: Text(hashtag[index].title, style: textTheme.headline1),
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
