import 'package:document_mobile/app/widget/folder_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bussiness/folder/bloc/folder_bloc.dart';
import '../../data/model/folder/folder_item.dart';

// ignore: must_be_immutable
class FolderSubFolderDetailList extends StatelessWidget {
  FolderSubFolderDetailList(
      {Key? key,
      this.folderList,
      required this.folderId,
      required this.idIndex})
      : super(key: key);
  FolderItemResponse? folderList;
  final int idIndex;
  final String folderId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(folderList!.result![idIndex].name!)),
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
                return FolderList(folderList: itemFolder);
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}
