import 'package:blog_tech/gen/assets.gen.dart';
import 'package:blog_tech/component/my_component.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../component/colors.dart';
import '../models/data_models.dart';
import '../models/fake_data.dart';
import '../component/strings.dart';

class MyCategories extends StatefulWidget {
  const MyCategories({super.key});

  @override
  State<MyCategories> createState() => _MyCategoriesState();
}

class _MyCategoriesState extends State<MyCategories> {
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    double bodyMargin = size.width / 10;
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
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: SizedBox(
                    width: double.infinity,
                    height: 100,
                    child: GridView.builder(
                      physics: const ClampingScrollPhysics(),
                      itemCount: hashtag.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                        crossAxisCount: 2,
                        childAspectRatio: 0.3,
                      ),
                      itemBuilder: ((context, index) {
                        return InkWell(
                            onTap: () {
                              setState(() {
                                if (!myCategories.contains(hashtag[index])) {
                                  myCategories.add(hashtag[index]);
                                } else {
                                  print("${hashtag[index].title} exist.");
                                }
                              });
                            },
                            child:
                                MainTags(textTheme: textTheme, index: index));
                      }),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Image.asset(
                    Assets.images.showBelow.path,
                    scale: 10,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: SizedBox(
                    width: double.infinity,
                    height: 100,
                    child: GridView.builder(
                      physics: const ClampingScrollPhysics(),
                      itemCount: myCategories.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                        crossAxisCount: 2,
                        childAspectRatio: 0.3,
                      ),
                      itemBuilder: ((context, index) {
                        return Container(
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              color: SolidColors.surface),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: (() {
                                    setState(() {
                                      myCategories.remove(myCategories[index]);
                                    });
                                  }),
                                  child: const Icon(CupertinoIcons.delete,
                                      color: Colors.grey),
                                ),
                                Center(
                                  child: Text(
                                    myCategories[index].title,
                                    style: textTheme.headline4,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    )));
  }
}
