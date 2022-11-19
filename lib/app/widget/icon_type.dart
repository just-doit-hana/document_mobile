import 'package:flutter/material.dart';

import '../util/util.dart';

Widget? iconType(String type, {double height = 44.0, width = 44.0}) {
  switch (type) {
    case 'Folder':
      return Image.asset(
        '${AppImage.path}/${AppImage.iconFolder}',
        width: width,
        height: height,
      );
    case 'DOC':
      return Image.asset(
        '${AppImage.path}/${AppImage.iconWord}',
        width: width,
        height: height,
      );
    case 'PDF':
      return Image.asset(
        '${AppImage.path}/${AppImage.iconPdf}',
        width: width,
        height: height,
      );
    case 'TXT':
      return Image.asset(
        '${AppImage.path}/${AppImage.iconTxt}',
        width: width,
        height: height,
      );
    case 'PPT':
      return Image.asset(
        '${AppImage.path}/${AppImage.iconPpt}',
        width: width,
        height: height,
      );
    case 'XLS':
      return Image.asset(
        '${AppImage.path}/${AppImage.iconExcell}',
        width: width,
        height: height,
      );
    case 'IMG':
      return Image.asset(
        '${AppImage.path}/${AppImage.iconImg}',
        width: width,
        height: height,
      );
    case 'VID':
      return Image.asset(
        '${AppImage.path}/${AppImage.iconVideo}',
        width: width,
        height: height,
      );
    case 'ZIP':
      return Image.asset(
        '${AppImage.path}/${AppImage.iconZip}',
        width: width,
        height: height,
      );
    case 'Unknown':
      return Image.asset(
        '${AppImage.path}/${AppImage.iconUnknow}',
        width: width,
        height: height,
      );
    default:
  }
  return null;
}
