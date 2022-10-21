import 'package:flutter/material.dart';

class PrivateFolder extends StatefulWidget {
  const PrivateFolder({Key? key}) : super(key: key);

  @override
  _PrivateFolderState createState() => _PrivateFolderState();
}

class _PrivateFolderState extends State<PrivateFolder> {
  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      title: Text(
        "Test",
        style: Theme.of(context).textTheme.headline2,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Material(
      child: Center(
        child: Text('Private  Folder'),
      ),
    );
  }
}
