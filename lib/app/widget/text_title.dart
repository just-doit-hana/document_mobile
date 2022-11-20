import 'package:flutter/material.dart';

import '../util/util.dart';

class TextTitle extends StatelessWidget {
  const TextTitle({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          fontFamily: AppConstant.poppinsFont,
          fontSize: 24,
          color: HexColor.fromHex(AppColor.blackTextColor)),
      textAlign: TextAlign.center,
    );
  }
}
