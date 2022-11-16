import 'package:document_appmobile/app/util/util.dart';
import 'package:document_appmobile/src/bussiness/folder/bloc/folder_bloc.dart';
import 'package:document_appmobile/src/data/model/folder/folder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../src/data/repository/folder/folder_repo.dart';

// ignore: must_be_immutable
class FolderList extends StatefulWidget {
  const FolderList({Key? key, required this.folder}) : super(key: key);
  final Result folder;
  @override
  // ignore: library_private_types_in_public_api
  _FolderListState createState() => _FolderListState();
}

class _FolderListState extends State<FolderList> {
  Widget imgIcon(String iconImage, {double height = 28.0, width = 28.0}) {
    return Image.asset(
      '${AppImage.path}/$iconImage',
      height: height,
      width: width,
      fit: BoxFit.cover,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
            FolderBloc((RepositoryProvider.of<FolderRepository>(context)))
              ..add(LoadFolderPublicEvent()),
        child: BlocListener<FolderBloc, FolderState>(
          listener: (context, state) {
            if (state is FolderErrorState) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.error)));
            }
          },
          child: BlocBuilder<FolderBloc, FolderState>(
            builder: (context, state) {
              if (state is FolderLoadingState) {
                return _buildLoading();
              }
              if (state is FolderLoadedState) {
                Result folderList = state.folder;
                return RefreshIndicator(
                  onRefresh: (() async =>
                      context.read<FolderBloc>().add(LoadFolderPublicEvent())),
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: folderList.subFolders.length,
                      itemBuilder: ((context, index) {
                        return FolderSubfolder(folderList);
                        //  return Column(
                        //     children: [
                        //       GestureDetector(
                        //         onDoubleTap: () {
                        //           // Navigator.of(context).push(CustomRoutesPage(
                        //           //     widget: FolderDetail(
                        //           //   id: index,
                        //           //   subFolders: folderList,
                        //           // )));
                        //         },
                        //         child: Card(
                        //             child: ListTile(
                        //                 title: Text(
                        //                     folderList.subFolders[index].name),
                        //                 subtitle: Text(formatDateTime(
                        //                     '2022-10-27T09:17:46.453697',
                        //                     hastime: false)),
                        //                 leading: imgIcon(AppImage.iconFolder),
                        //                 trailing: ElevatedButton(
                        //                     onPressed: () {},
                        //                     style: ElevatedButton.styleFrom(
                        //                       elevation: 0.0,
                        //                       backgroundColor:
                        //                           Colors.red.withOpacity(0),
                        //                       shape: const RoundedRectangleBorder(
                        //                           borderRadius: BorderRadius.all(
                        //                             Radius.circular(2),
                        //                           ),
                        //                           side: BorderSide(
                        //                               color: Colors.white)),
                        //                     ),
                        //                     child: const Icon(
                        //                       Icons.more_vert_outlined,
                        //                       color: Colors.black54,
                        //                     )))),
                        //       ),
                        //     ],
                        //   );
                      })),
                );
              }
              return Container();
            },
          ),
        ));
  }

  Widget _buildLoading() => const Center(child: CircularProgressIndicator());
}

class FolderSubfolder extends StatelessWidget {
  const FolderSubfolder(this.subfolder, {super.key});

  final Result subfolder;
  Widget _buildTile(Result root) {
    if (root.subFolders.isEmpty) {
      return ListTile(
        title: Text(root.name),
      );
    }
    return ExpansionTile(
      title: Text(root.name),
      children: root.subFolders.map((child) => _buildTile(child)).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTile(subfolder);
  }
}
