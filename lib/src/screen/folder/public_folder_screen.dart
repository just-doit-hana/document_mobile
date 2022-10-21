import 'package:flutter/material.dart';

class PublicFolder extends StatefulWidget {
  const PublicFolder({Key? key}) : super(key: key);

  @override
  _PublicFolderState createState() => _PublicFolderState();
}

class _PublicFolderState extends State<PublicFolder> {
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
        child: Text('Public Folder'),
      ),
    );
  }
}
