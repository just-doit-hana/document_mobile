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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context, 'Cancel');
                        shouldDismiss = false;
                      },
                      child: const Text('Cancel')),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context, 'Delete');
                        shouldDismiss = true;
                      },
                      child: const Text('Delete'))
                ],
              )
            ],
          )));
  return shouldDismiss;
}
