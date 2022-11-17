import 'package:flutter/material.dart';

import '../util/util.dart';

Widget? iconType(String type, {double height = 4.0, width = 4.0}) {
  switch (type) {
    case 'Folder':
      return Image.asset('${AppImage.path}/${AppImage.iconWord}');
    case 'DOC':
      return Image.asset('${AppImage.path}/${AppImage.iconWord}');
    case 'PDF':
      return Image.asset('${AppImage.path}/${AppImage.iconPdf}');
    case 'TXT':
      return Image.asset('${AppImage.path}/${AppImage.iconTxt}');
    case 'PPT':
      return Image.asset('${AppImage.path}/${AppImage.iconPpt}');
    case 'XLS':
      return Image.asset('${AppImage.iconExcell}/${AppImage.iconExcell}');
    case 'IMG':
      return Image.asset('${AppImage.iconImg}/${AppImage.iconImg}');
    case 'VID':
      return Image.asset('${AppImage.path}/${AppImage.iconVideo}');
    case 'ZIP':
      return Image.asset('${AppImage.iconUnknow}/${AppImage.iconZip}');
    case 'Unknown':
      return Image.asset('${AppImage.iconUnknow}/${AppImage.iconUnknow}');
    default:
  }
  return null;
}
