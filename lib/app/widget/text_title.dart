import 'package:document_appmobile/app/util/app_extension.dart';
import 'package:document_appmobile/app/util/util.dart';
import 'package:flutter/material.dart';

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
