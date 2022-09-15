import '../strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../gen/assets.gen.dart';

class RegisterIntro extends StatelessWidget {
  const RegisterIntro({Key? key}) : super(key: key);

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
              showModalBottomSheet(
                backgroundColor: Colors.transparent,
                context: context,
                builder: ((context) {
                  return Container(
                    height: size.height / 2,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                  );
                }),
              );
            },
            child: const Text("Start"),
          ),
        ],
      ))),
    );
  }
}
