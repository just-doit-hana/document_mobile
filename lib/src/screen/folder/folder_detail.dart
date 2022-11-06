import 'package:document_appmobile/app/widget/folder_list.dart';
import 'package:document_appmobile/src/data/model/folder/folder.dart';
import 'package:flutter/material.dart';

class FolderDetail extends StatelessWidget {
  const FolderDetail({Key? key, required this.subFolders, required this.id})
      : super(key: key);
  final List<Result> subFolders;
  final int id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(subFolders[id].name)),
      body: FolderList(),
    );
  }
}
