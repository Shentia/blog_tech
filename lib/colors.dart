import 'package:flutter/cupertino.dart';

class solidColors {
  static const Color primaryColor = Color.fromARGB(255, 68, 4, 87);
  static const Color title = Color.fromARGB(255, 40, 107, 184);
  static const Color subtitle = Color.fromARGB(255, 0, 0, 0);
  static const Color scaffoldIcon = Color.fromARGB(255, 0, 0, 0);
  static const Color scaffold = Color.fromARGB(255, 255, 255, 255);
  static const Color systemNavigationBarColor =
      Color.fromARGB(255, 255, 255, 255);
  static const Color lightText = Color.fromARGB(255, 255, 255, 255);
  static const Color selectedPodcast = Color.fromARGB(255, 255, 139, 26);
  static const Color submitArticle = Color.fromARGB(255, 209, 209, 209);
  static const Color submitPodcast = Color.fromARGB(255, 246, 246, 246);
  static const Color subText = Color.fromARGB(255, 197, 197, 197);
  static const Color statusBarColor = Color.fromARGB(255, 255, 255, 255);
  static const Color posterTitle = Color.fromARGB(255, 255, 255, 255);
  static const Color posterSubTitle = Color.fromARGB(200, 255, 255, 255);
  static const Color moreArticles = Color.fromARGB(255, 40, 107, 184);
}

class GradientColors {
  static const LinearGradient buttomNav = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color.fromARGB(255, 25, 0, 94),
      Color.fromARGB(255, 68, 4, 87),
    ],
  );
  static const LinearGradient tags = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color.fromARGB(255, 0, 0, 0),
      Color.fromARGB(255, 63, 63, 63),
    ],
  );
  static const LinearGradient bannerCoverGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color.fromARGB(0, 0, 0, 0),
      Color.fromARGB(100, 72, 20, 88),
      Color.fromARGB(255, 28, 20, 81),
    ],
  );
  static const LinearGradient hashtagGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color.fromARGB(255, 88, 0, 120),
      Color.fromARGB(255, 127, 79, 142),
      Color.fromARGB(255, 28, 0, 40),
    ],
  );
  static const LinearGradient bottomNavigationBackground = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color.fromARGB(0, 255, 255, 255),
      Color.fromARGB(255, 255, 255, 255),
    ],
  );
  static const LinearGradient bottomNav = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color.fromARGB(255, 25, 0, 94),
      Color.fromARGB(255, 68, 4, 87),
    ],
  );
}
