import 'package:document_appmobile/src/bussiness/folder/bloc/folder_bloc.dart';
import 'package:document_appmobile/src/data/model/folder/folder.dart';
import 'package:document_appmobile/src/data/model/folder/folder_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class FolderDetail extends StatelessWidget {
  FolderDetail({Key? key, required this.subFolders, required this.id})
      : super(key: key);
  Result subFolders;
  final int id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(subFolders.subFolders[id].name)),
      body: BlocProvider(
        create: (context) => FolderBloc(RepositoryProvider.of(context))
          ..add(LoadFolderItemEvent(id: subFolders.id)),
        child: BlocListener<FolderBloc, FolderState>(
          listener: (context, state) {
            if (state is FolderItemErrorState) {
              // ScaffoldMessenger.of(context)
              //     .showSnackBar(SnackBar(content: Text(state.error)));
              print(state.error);
            }
          },
          child: BlocBuilder<FolderBloc, FolderState>(
            builder: (context, state) {
              if (state is FolderItemLoaded) {
                FolderItemResponse itemFolder = state.resultItemFolder!;
                print(itemFolder.result[0].accessScope);
                return Container(
                    child: Column(
                  children: [
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: itemFolder.result.length,
                        itemBuilder: (context, index) {
                          return Text(itemFolder.result[index].name!);
                        })
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
