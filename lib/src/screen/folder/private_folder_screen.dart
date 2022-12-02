import 'package:document_mobile/src/bussiness/file/bloc/file_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/widget/folder_grid.dart';
import '../../../app/widget/folder_list.dart';
import '../../../app/widget/widget.dart';
import '../../bussiness/folder/bloc/folder_bloc.dart';
import '../../data/model/folder/folder_item.dart';

class PrivateFolder extends StatefulWidget {
  const PrivateFolder({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _PrivateFolderState createState() => _PrivateFolderState();
}

class _PrivateFolderState extends State<PrivateFolder> {
  bool isType = false;
  int? count;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FolderBloc(RepositoryProvider.of(context))
            ..add(LoadFolderPrivateEvent()),
        ),
        BlocProvider(
          create: (context) => FileBloc((RepositoryProvider.of(context))),
        )
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<FolderBloc, FolderState>(
            listener: (context, state) {
              if (state is FolderPrivateErrorState) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(state.error)));
              }
            },
          ),
          // BlocListener<FileBloc, FileState>(
          //   listener: (context, state) {
          //     if (state is RenameFileLoadedState) {
          //       const Center(
          //         child: CircularProgressIndicator(
          //           color: Colors.redAccent,
          //         ),
          //       );
          //     }
          //   },
          // ),
        ],
        child: BlocBuilder<FolderBloc, FolderState>(
          builder: (context, state) {
            // if (state is FolderPrivateLoadingState) {
            //   return const Center(
            //     child: CircularProgressIndicator(
            //       color: Colors.redAccent,
            //     ),
            //   );
            // }
            if (state is FolderPrivateLoadedState) {
              FolderItemResponse privateFolder = state.privateFolder;
              return RefreshIndicator(
                onRefresh: ((() async =>
                    context.read<FolderBloc>()..add(LoadFolderPrivateEvent()))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: SingleChildScrollView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        child: Column(
                          children: <Widget>[
                            Container(
                                color: Colors.transparent,
                                padding: const EdgeInsets.only(top: 10),
                                // width: double.infinity,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextSeachButton(
                                        onPressed: (() {
                                          // ShowModalSearchName(context);
                                        }),
                                        title: 'Name',
                                        iconData: Icons.arrow_upward_outlined),
                                    const TextSeachButton(
                                        title: 'Label',
                                        iconData: Icons.arrow_upward_outlined),
                                    IconButton(
                                        onPressed: () {
                                          setState(() {
                                            isType = !isType;
                                          });
                                        },
                                        icon: isType
                                            ? const Icon(
                                                Icons.grid_view_outlined)
                                            : const Icon(Icons.list_outlined)),
                                  ],
                                )),
                            isType
                                ? (FolderGrid(
                                    folderGrid: privateFolder.result,
                                  ))
                                : (FolderList(
                                    folderList: privateFolder,
                                  )),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
