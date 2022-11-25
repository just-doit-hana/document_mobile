import 'package:document_mobile/src/data/model/folder/folder_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/animation/routes_animation.dart';
import '../../../app/helper/format_date_time.dart';
import '../../../app/util/util.dart';
import '../../../app/widget/widget.dart';
import '../../bussiness/folder/bloc/folder_bloc.dart';
import '../../data/model/folder/folder_result_folder.dart';
import '../files/file_detail.dart';

class AchiveFileScreen extends StatefulWidget {
  const AchiveFileScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AchiveFileScreenState createState() => _AchiveFileScreenState();
}

class _AchiveFileScreenState extends State<AchiveFileScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text(
          'Achived File',
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontFamily: AppConstant.poppinsFont,
              fontSize: 17),
        )),
        body: BlocProvider(
          create: (context) => FolderBloc(RepositoryProvider.of(context))
            ..add(LoadFolderBackupEvent()),
          child: BlocConsumer<FolderBloc, FolderState>(
            listener: (context, state) {
              if (state is FolderBackupError) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(state.error)));
                // } else if (state is FolderRecycleLoading) {
                //   ScaffoldMessenger.of(context)
                //       .showSnackBar(const SnackBar(content: Text('Loading folder')));
                // } else if (state is FolderRecycleLoaded &&
                //     state.recycleBin.result!.isEmpty) {
                //   ScaffoldMessenger.of(context)
                //       .showSnackBar(const SnackBar(content: Text('No more folder')));
                //   context.read<FolderBloc>().isFetching = false;
              }
            },
            builder: (context, state) {
              if (state is FolderBackupLoaded) {
                FolderItemResponse recycleBin = state.folderBackup;
                return RefreshIndicator(
                  onRefresh: () async =>
                      context.read<FolderBloc>()..add(LoadFolderBackupEvent()),
                  child: ListView.builder(
                      controller: _scrollController
                        ..addListener(() {
                          if (_scrollController.offset ==
                                  _scrollController.position.maxScrollExtent &&
                              !context.read<FolderBloc>().isFetching) {
                            context.read<FolderBloc>()
                              ..isFetching = true
                              ..add(LoadFolderBackupEvent());
                          }
                        }),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      primary: false,
                      itemCount: recycleBin.result!.length,
                      itemBuilder: (context, index) {
                        return CardList(
                          recycleBin: recycleBin.result![index],
                          onPressed: (r) {},
                        );
                      }),
                );
              }
              return Container();
            },
          ),
        ));
  }
  // if (state is FolderRecyleError) {
  //   return Column(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     crossAxisAlignment: CrossAxisAlignment.center,
  //     children: [
  //       IconButton(
  //         onPressed: () {
  //           context.read<FolderBloc>()
  //             ..isFetching = true
  //             ..add(LoadFolderRecycleBinEvent());
  //         },
  //         icon: const Icon(Icons.refresh),
  //       ),
  //       const SizedBox(height: 15),
  //       Text(state.error, textAlign: TextAlign.center),
  //     ],
  //   );
  // }

  //     ),
  //   ),
  // );
}

class CardList extends StatelessWidget {
  const CardList({Key? key, required this.recycleBin, this.onPressed})
      : super(key: key);

  final ResultItemFolder recycleBin;
  final void Function(ResultItemFolder)? onPressed;
  // void _showDialog(BuildContext context) {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: Text("Alert!!"),
  //         content: Text("You are awesome!"),
  //         actions: [
  //           MaterialButton(
  //             child: Text("OK"),
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //             },
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: (() => onPressed),
        child: Card(
          child: ListTile(
              leading: iconType(recycleBin.type!),
              title: Text(recycleBin.name!),
              subtitle:
                  Text(formatDateTime(recycleBin.lastModified!, hastime: true)),
              trailing: PopupMenuButton(
                icon: const Icon(Icons.more_vert),
                itemBuilder: (context) => [
                  // PopupMenuItem 1
                  PopupMenuItem(
                    value: 1,
                    // row with 2 children
                    child: Row(
                      children: const [
                        Icon(Icons.info_outline),
                        SizedBox(
                          width: 10,
                        ),
                        Text("View Detail")
                      ],
                    ),
                  ),
                  // PopupMenuItem 2
                  PopupMenuItem(
                    value: 2,
                    // row with two children
                    child: Row(
                      children: const [
                        Icon(Icons.restore_outlined),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Restore")
                      ],
                    ),
                  ),
                ],
                offset: const Offset(0, 70),
                // color: Colors.transparent,
                elevation: 2,
                // on selected we show the dialog box
                onSelected: (value) {
                  // if value 1 show dialog
                  if (value == 1) {
                    Navigator.of(context).push(CustomRoutesPage(
                        widget: FileDetail(
                      fileId: recycleBin.id!,
                    )));
                    // if value 2 show dialog
                  } else if (value == 2) {
                    context
                        .read<FolderBloc>()
                        .add(RestoreBackupEvent(id: recycleBin.id!));
                    context.read<FolderBloc>().add(LoadFolderBackupEvent());
                  }
                },
              )),
        ));
  }
}
