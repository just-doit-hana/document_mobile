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
    {required String title,
    required String content,
    required String nameBtn}) async {
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
                        nameBtn,
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

class DialogModalSheet extends StatelessWidget {
  const DialogModalSheet({
    Key? key,
    required this.title,
    this.content,
    required this.onPressed,
    required this.nameBtn,
  }) : super(key: key);
  final String title;
  final String? content;
  final String nameBtn;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      title: Text(title),
      content: Text(content!),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Cancel')),
            TextButton(onPressed: onPressed, child: Text(nameBtn))
          ],
        )
      ],
    );
  }
}

class DialogModalRenameSheet extends StatelessWidget {
  const DialogModalRenameSheet({
    Key? key,
    required this.title,
    required this.onPressed,
    required this.controller,
    required this.nameBtn,
  }) : super(key: key);
  final String title;
  final String nameBtn;
  final VoidCallback onPressed;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      title: Text(title),
      content: SizedBox(
        width: 400.0,
        height: 50,
        child: TextField(
          controller: controller,
          autofocus: true,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
              filled: true,
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(8.0))),
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Cancel')),
            TextButton(onPressed: onPressed, child: Text(nameBtn))
          ],
        )
      ],
    );
  }
}
