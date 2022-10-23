import 'package:document_appmobile/app/widget/widget.dart';
import 'package:flutter/material.dart';

class PrivateFolder extends StatefulWidget {
  const PrivateFolder({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _PrivateFolderState createState() => _PrivateFolderState();
}

class _PrivateFolderState extends State<PrivateFolder> {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextSeachButton(
              title: 'Name', iconData: Icons.arrow_upward_outlined),
          const TextSeachButton(
              title: 'Label', iconData: Icons.arrow_upward_outlined),
          IconButton(onPressed: () {}, icon: const Icon(Icons.list_outlined)),
        ],
      ),
    ));
  }
}
