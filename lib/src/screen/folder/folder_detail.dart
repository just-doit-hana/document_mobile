import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bussiness/folder/bloc/folder_bloc.dart';
import '../../data/model/folder/folder.dart';
import '../../data/model/folder/folder_item.dart';

// ignore: must_be_immutable
class FolderDetail extends StatelessWidget {
  FolderDetail({Key? key, this.subFolders, required this.id}) : super(key: key);
  Result? subFolders;
  List<ResultItemFolder>? folderItem;
  final int id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(subFolders!.subFolders[id].name)),
      body: BlocProvider(
        create: (context) => FolderBloc(RepositoryProvider.of(context))
          ..add(LoadFolderItemEvent(id: subFolders?.subFolders[id].id)),
        child: BlocListener<FolderBloc, FolderState>(
          listener: (context, state) {
            if (state is FolderItemErrorState) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.error)));
            }
          },
          child: BlocBuilder<FolderBloc, FolderState>(
            builder: (context, state) {
              print('Test id ${subFolders?.subFolders[id].id}');
              if (state is FolderItemLoaded) {
                FolderItemResponse itemFolder = state.resultItemFolder!;
                return Container(
                    child: Column(
                  children: [
                    Flexible(
                      flex: 1,
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: folderItem!.length,
                          itemBuilder: (context, index) {
                            return FolderSubFolder(
                              itemFolder,
                              index,
                            );
                          }),
                    )
                  ],
                ));
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}

class FolderSubFolder extends StatelessWidget {
  const FolderSubFolder(this.subbFolder, this.index, {super.key});

  final FolderItemResponse subbFolder;
  // final List<ResultItemFolder> folderItem;
  final int index;
  Widget _buildTile(root) {
    if (root.result.isEmpty) {
      return ListTile(
        title: Text(root.result[index].name!),
      );
    }
    return ExpansionTile(
      title: Text(root.result[index].name!),
      children: root.result!.map((child) => _buildTile(child)).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTile(subbFolder);
  }
}
