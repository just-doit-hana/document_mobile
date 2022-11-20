import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bussiness/folder/bloc/folder_bloc.dart';
import '../../data/model/folder/folder.dart';

class MyfileScreen extends StatefulWidget {
  const MyfileScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyfileScreenState createState() => _MyfileScreenState();
}

class _MyfileScreenState extends State<MyfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('My files')),
        body: BlocBuilder<FolderBloc, FolderState>(
          builder: (context, state) {
            if (state is FolderLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is FolderLoadedState) {
              Result folderList = state.folder;
              return ListView.builder(
                  itemCount: folderList.subFolders.length,
                  itemBuilder: (_, index) {
                    return Card(
                        color: Colors.blue,
                        child: ListTile(
                            title: Text(folderList.subFolders[index].name)));
                  });
            }
            if (state is FolderErrorState) {
              return const Center(
                child: Text('Error'),
              );
            }
            return Container();
          },
        ));
  }
}
