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
  // final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
          'Achived File',
          style: h4StyleLight,
        )),
        body: BlocProvider(
          create: (context) => FolderBloc(RepositoryProvider.of(context))
            ..add(LoadFolderBackupEvent()),
          child: BlocConsumer<FolderBloc, FolderState>(
            listener: (context, state) {
              if (state is FolderBackupError) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(state.error)));
              }
            },
            builder: (context, state) {
              if (state is FolderBackupLoading) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.redAccent,
                  ),
                );
              }
              if (state is FolderBackupLoaded) {
                FolderItemResponse recycleBin = state.folderBackup;
                return RefreshIndicator(
                  onRefresh: () async =>
                      context.read<FolderBloc>()..add(LoadFolderBackupEvent()),
                  child: ListView.builder(
                      // controller: _scrollController
                      //   ..addListener(() {
                      //     if (_scrollController.offset ==
                      //             _scrollController.position.maxScrollExtent &&
                      //         !context.read<FolderBloc>().isFetching) {
                      //       context.read<FolderBloc>()
                      //         ..isFetching = true
                      //         ..add(LoadFolderBackupEvent());
                      //     }
                      //   }),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      primary: false,
                      itemCount: recycleBin.result!.length,
                      itemBuilder: (context, index) {
                        return CardList(
                          recycleBin: recycleBin.result![index],
                        );
                      }),
                );
              }
              return Container();
            },
          ),
        ));
  }
}

class CardList extends StatelessWidget {
  const CardList({Key? key, required this.recycleBin}) : super(key: key);

  final ResultItemFolder recycleBin;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: (() => {}),
        child: Card(
          child: ListTile(
              leading: iconType(recycleBin.type!),
              title: Text(recycleBin.name!),
              subtitle:
                  Text(formatDateTime(recycleBin.lastModified!, hastime: true)),
              trailing: PopupMenuButton(
                icon: const Icon(Icons.more_vert),
                itemBuilder: (context) => [
                  PopupMenuItem(
                    value: 1,
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
                  PopupMenuItem(
                    value: 2,
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
                elevation: 2,
                onSelected: (value) {
                  if (value == 1) {
                    Navigator.of(context).push(CustomRoutesPage(
                        widget: FileDetail(
                      fileId: recycleBin.id!,
                    )));
                  } else if (value == 2) {
                    context
                        .read<FolderBloc>()
                        .add(RestoreBackupEvent(id: recycleBin.id!));
                  }
                },
              )),
        ));
  }
}
