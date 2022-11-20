import 'package:flutter/material.dart';

class ListTitleModal extends StatelessWidget {
  const ListTitleModal(
      {Key? key, required this.content, this.onPress, required this.icon})
      : super(key: key);
  final String content;
  final VoidCallback? onPress;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPress,
      minLeadingWidth: 11,
      leading: Icon(icon),
      title: Text(content),
    );
  }
}
