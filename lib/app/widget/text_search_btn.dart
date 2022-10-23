import 'package:flutter/material.dart';

class TextSeachButton extends StatelessWidget {
  const TextSeachButton({
    Key? key,
    required this.title,
    required this.iconData,
    this.onPressed,
  }) : super(key: key);

  final String title;
  final IconData iconData;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      label: Text(title),
      icon: Icon(iconData),
      onPressed: onPressed,
      style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(Colors.black),
          backgroundColor:
              MaterialStateProperty.all<Color>(Colors.transparent)),
    );
  }
}
