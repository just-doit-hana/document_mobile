import 'package:document_mobile/app/util/util.dart';
import 'package:flutter/material.dart';

void showMessageSnackbar(BuildContext context, String messgae, {Color? color}) {
  final snackBar = SnackBar(
    content: Text(messgae),
    backgroundColor: color,
    behavior: SnackBarBehavior.floating,
  );
  final scaffoldMsg = ScaffoldMessenger.of(context);
  scaffoldMsg
    ..hideCurrentSnackBar()
    ..showSnackBar(snackBar);
}

Future<bool> showConfimation(BuildContext context,
    {required String title, required String content}) async {
  bool shouldDismiss = false;
  await showDialog(
      context: context,
      builder: ((context) => AlertDialog(
            title: Text(title),
            content: Text(content),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context, 'Cancel');
                        shouldDismiss = false;
                      },
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                            color: HexColor.fromHex(AppColor.primaryBtnColor),
                            fontFamily: AppConstant.poppinsFont),
                      )),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context, 'Delete');
                        shouldDismiss = true;
                      },
                      child: Text(
                        'Delete',
                        style: TextStyle(
                            color: HexColor.fromHex(AppColor.primaryBtnColor),
                            fontFamily: AppConstant.poppinsFont),
                      )),
                ],
              )
            ],
          )));
  return shouldDismiss;
}
