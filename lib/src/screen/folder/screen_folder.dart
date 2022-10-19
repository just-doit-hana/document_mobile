import 'package:flutter/material.dart';

class ScreenFolder extends StatefulWidget {
  const ScreenFolder({Key? key}) : super(key: key);

  @override
  _ScreenFolderState createState() => _ScreenFolderState();
}

class _ScreenFolderState extends State<ScreenFolder> {
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
    return Container();
  }
}
