import 'package:blog_tech/colors.dart';
import 'package:blog_tech/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.light.copyWith(
      statusBarColor: solidColors.statusBarColor,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: solidColors.systemNavigationBarColor,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: 'whitney',
          textTheme: const TextTheme(
            headline1: TextStyle(
              fontFamily: 'whitney',
              fontSize: 20,
              color: solidColors.posterTitle,
              fontWeight: FontWeight.w700,
            ),
            subtitle1: TextStyle(
              fontFamily: 'whitney',
              fontSize: 16,
              color: solidColors.posterSubTitle,
              fontWeight: FontWeight.w300,
            ),
            bodyText1: TextStyle(
              fontFamily: 'whitney',
              fontSize: 16.0,
              fontWeight: FontWeight.w300,
            ),
            headline2: TextStyle(
                fontFamily: 'whitney',
                fontSize: 36.0,
                fontWeight: FontWeight.w300),
            headline3: TextStyle(
                fontFamily: 'whitney',
                fontSize: 24.0,
                fontWeight: FontWeight.w300),
            headline4: TextStyle(
                fontFamily: 'whitney',
                fontSize: 20.0,
                fontWeight: FontWeight.w300),
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: SplashScreen());
  }
}
