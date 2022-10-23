import 'package:flutter/material.dart';

class AppBtnSearchModal extends StatelessWidget {
  const AppBtnSearchModal(
      {Key? key, required this.title, required this.icon, this.onPressed})
      : super(key: key);
  final String title;
  final IconData icon;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 10, top: 10),
      height: 54,
      width: double.infinity,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(24),
                bottomRight: Radius.circular(24)),
          )),
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [Icon(icon), Text(title)],
          )),
    );
  }
}
