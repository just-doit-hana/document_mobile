import 'package:document_appmobile/src/bussiness/folder/bloc/folder_bloc.dart';

import 'package:document_appmobile/src/data/repository/folder/folder_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/folder/folder.dart';

class MyfileScreen extends StatefulWidget {
  const MyfileScreen({Key? key}) : super(key: key);

  @override
  _MyfileScreenState createState() => _MyfileScreenState();
}

class _MyfileScreenState extends State<MyfileScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          FolderBloc((RepositoryProvider.of<FolderRepository>(context)))
            ..add(LoadFolderPublicEvent()),
      child: Scaffold(
          appBar: AppBar(title: const Text('My files')),
          body: BlocBuilder<FolderBloc, FolderState>(
            builder: (context, state) {
              if (state is FolderLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is FolderLoadedState) {
                List<FolderResponse> userList = state.folder;
                // print('User list ${userList}');
                return ListView.builder(
                    itemCount: userList.length,
                    itemBuilder: (_, index) {
                      return Card(
                        color: Colors.blue,
                        child: ListTile(
                          title: Text(userList[index].result!.name),
                        ),
                      );
                    });
              }
              if (state is FolderErrorState) {
                return const Center(
                  child: Text('Error'),
                );
              }
              return Container();
            },
          )),
    );
  }
}
