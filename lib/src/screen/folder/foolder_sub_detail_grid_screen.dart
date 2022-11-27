import 'package:document_mobile/app/util/util.dart';
import 'package:document_mobile/app/widget/folder_grid.dart';
import 'package:document_mobile/src/data/model/folder/folder_result_folder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bussiness/folder/bloc/folder_bloc.dart';
import '../../data/model/folder/folder_item.dart';

// ignore: must_be_immutable
class FolderSubFolderDetailGrid extends StatelessWidget {
  FolderSubFolderDetailGrid(
      {Key? key,
      this.folderList,
      required this.folderId,
      required this.idIndex})
      : super(key: key);
  List<ResultItemFolder>? folderList;
  final int idIndex;
  final String folderId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        folderList![idIndex].name!,
        style: h4StyleLight,
      )),
      body: BlocProvider(
        create: (context) => FolderBloc(RepositoryProvider.of(context))
          ..add(LoadFolderItemEvent(id: folderId)),
        child: BlocListener<FolderBloc, FolderState>(
          listener: (context, state) {
            if (state is FolderItemErrorState) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.error)));
            }
          },
          child: BlocBuilder<FolderBloc, FolderState>(
            builder: (context, state) {
              if (state is FolderItemLoaded) {
                FolderItemResponse itemFolder = state.resultItemFolder!;

                return FolderGrid(folderGrid: itemFolder.result);
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}
