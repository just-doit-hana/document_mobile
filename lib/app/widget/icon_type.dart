import 'package:flutter/material.dart';

import '../util/util.dart';

Widget? iconType(String type, {double height = 44.0, width = 44.0}) {
  switch (type) {
    case AppConstant.folder:
      return Image.asset(
        '${AppImage.path}/${AppImage.iconFolder}',
        width: width,
        height: height,
        fit: BoxFit.cover,
      );
    case AppConstant.doc:
      return Image.asset(
        '${AppImage.path}/${AppImage.iconWord}',
        width: width,
        height: height,
      );
    case AppConstant.pdf:
      return Image.asset(
        '${AppImage.path}/${AppImage.iconPdf}',
        width: width,
        height: height,
      );
    case AppConstant.txt:
      return Image.asset(
        '${AppImage.path}/${AppImage.iconTxt}',
        width: width,
        height: height,
      );
    case AppConstant.ppt:
      return Image.asset(
        '${AppImage.path}/${AppImage.iconPpt}',
        width: width,
        height: height,
      );
    case AppConstant.xls:
      return Image.asset(
        '${AppImage.path}/${AppImage.iconExcell}',
        width: width,
        height: height,
      );
    case AppConstant.img:
      return Image.asset(
        '${AppImage.path}/${AppImage.iconImg}',
        width: width,
        height: height,
      );
    case AppConstant.video:
      return Image.asset(
        '${AppImage.path}/${AppImage.iconVideo}',
        width: width,
        height: height,
      );
    case AppConstant.zip:
      return Image.asset(
        '${AppImage.path}/${AppImage.iconZip}',
        width: width,
        height: height,
      );
    case AppConstant.unknow:
      return Image.asset(
        '${AppImage.path}/${AppImage.iconUnknow}',
        width: width,
        height: height,
      );
    default:
  }
  return null;
}
