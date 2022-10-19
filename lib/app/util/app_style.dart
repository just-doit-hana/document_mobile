import 'package:document_appmobile/app/util/app_color.dart';
import 'package:document_appmobile/app/util/app_constant.dart';
import 'package:document_appmobile/app/util/app_extension.dart';
import 'package:flutter/material.dart';

final h1Style = TextStyle(
    fontSize: 25,
    fontFamily: AppConstant.poppinsFont,
    fontWeight: FontWeight.w700,
    color: HexColor.fromHex(AppColor.blackTextColor));

final h2Style = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 19,
    fontFamily: AppConstant.poppinsFont,
    color: HexColor.fromHex(AppColor.blackTextColor));

final h3Style = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 18,
    fontFamily: AppConstant.poppinsFont,
    color: HexColor.fromHex(AppColor.blackTextColor));

final h4StyleLight = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 17,
    fontFamily: AppConstant.poppinsFont,
    color: HexColor.fromHex(AppColor.blackTextColor));

final h5StyleLight = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 15,
    fontFamily: AppConstant.poppinsFont,
    color: HexColor.fromHex(AppColor.blackTextColor));

final bodyTextLight = TextStyle(
    fontSize: 13,
    fontFamily: AppConstant.poppinsFont,
    fontWeight: FontWeight.w600,
    color: HexColor.fromHex(AppColor.blackTextColor));

final subtitleLight = TextStyle(
    fontSize: 12,
    fontFamily: AppConstant.poppinsFont,
    fontWeight: FontWeight.bold,
    color: HexColor.fromHex(AppColor.blackTextColor));

final textFieldStyle = OutlineInputBorder(
  borderRadius: BorderRadius.circular(25),
  borderSide: const BorderSide(color: Colors.transparent),
);
