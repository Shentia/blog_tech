import 'package:flutter/material.dart';
import './colors.dart';

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
