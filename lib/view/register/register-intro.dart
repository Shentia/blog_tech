import 'package:blog_tech/view/my_categories.dart';
import 'package:get/get.dart';

import '../../component/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:validators/validators.dart';
import '../../controller/register-controller.dart';
import '../../gen/assets.gen.dart';

class RegisterIntro extends StatelessWidget {
  RegisterIntro({Key? key}) : super(key: key);
  RegisterController registerController = Get.put(RegisterController());
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
            onPressed: () {
              _showEmailBottomSheet(context, size, textTheme);
            },
            child: const Text("Start"),
          ),
        ],
      ))),
    );
  }

  Future<dynamic> _showEmailBottomSheet(
      BuildContext context, Size size, TextTheme textTheme) {
    // RegExp isEmail = RegExp('^[a-zA-Z0-9]+@');

    return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: ((context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            height: size.height / 2,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(Strings.interEmail, style: textTheme.headline4),
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: TextField(
                      controller: registerController.emailTextEditingController,
                      onChanged: (value) {
                        print(
                            "$value is email: ${isEmail(value)}"); // print(value +
                        //     "is email = " +
                        //     isEmail.hasMatch(value).toString());
                      },
                      style: textTheme.headline5,
                      autofocus: true,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        hintText: "email@domain.com",
                        hintStyle: textTheme.headline5,
                      ),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        _activatedBottomSheet(context, size, textTheme);
                      },
                      child: const Text("Continue"))
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  Future<dynamic> _activatedBottomSheet(
      BuildContext context, Size size, TextTheme textTheme) {
    // RegExp isEmail = RegExp('^[a-zA-Z0-9]+@');

    return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: ((context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            height: size.height / 2,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(Strings.activated, style: textTheme.headline4),
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: TextField(
                      controller:
                          registerController.activetedCodeTextEditingController,
                      onChanged: (value) {
                        print(
                            "$value is email: ${isEmail(value)}"); // print(value +
                        //     "is email = " +
                        //     isEmail.hasMatch(value).toString());
                      },
                      style: textTheme.headline5,
                      autofocus: true,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        hintText: "******",
                        hintStyle: textTheme.headline5,
                      ),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => const MyCategories()));
                      },
                      child: const Text("Continue"))
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
