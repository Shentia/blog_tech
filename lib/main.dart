import 'package:blog_tech/colors.dart';
import 'package:blog_tech/screen/home.dart';
import 'package:blog_tech/screen/my_categories.dart';
import 'package:blog_tech/screen/register-intro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.light.copyWith(
      statusBarColor: SolidColors.statusBarColor,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: SolidColors.systemNavigationBarColor,
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
        inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(width: 2),
            ),
            filled: true,
            fillColor: SolidColors.statusBarColor),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            textStyle: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.pressed)) {
                return const TextStyle(fontSize: 25);
              }
              return const TextStyle(fontSize: 20);
            }),
            backgroundColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.pressed)) {
                return SolidColors.moreArticles;
              }
              return SolidColors.primaryColor;
            }),
          ),
        ),
        fontFamily: 'whitney',
        textTheme: const TextTheme(
          headline1: TextStyle(
            fontFamily: 'whitney',
            fontSize: 20,
            color: SolidColors.posterTitle,
            fontWeight: FontWeight.w700,
          ),
          subtitle1: TextStyle(
            fontFamily: 'whitney',
            fontSize: 16,
            color: SolidColors.posterSubTitle,
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
              fontWeight: FontWeight.w300,
              color: SolidColors.moreArticles),
          headline4: TextStyle(
              fontFamily: 'whitney',
              fontSize: 20.0,
              fontWeight: FontWeight.w300),
          headline5: TextStyle(
              fontFamily: 'whitney',
              fontSize: 18.0,
              color: SolidColors.hintText,
              fontWeight: FontWeight.w500),
        ),
      ),
      debugShowCheckedModeBanner: false,
      // home: SplashScreen());
      home: const MyCategories(),
    );
  }
}
