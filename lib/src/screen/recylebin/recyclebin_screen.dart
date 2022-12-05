import 'package:document_mobile/src/data/model/folder/folder_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/helper/format_date_time.dart';
import '../../../app/util/util.dart';
import '../../../app/widget/app_dialogs.dart';
import '../../../app/widget/widget.dart';
import '../../bussiness/folder/bloc/folder_bloc.dart';
import '../../data/model/folder/folder_result_folder.dart';

class RecyclebinScreen extends StatefulWidget {
  const RecyclebinScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _RecyclebinScreenState createState() => _RecyclebinScreenState();
}

class _RecyclebinScreenState extends State<RecyclebinScreen> {
  // ScrollController? _scrollController;
  late List<ResultItemFolder> selectedList;
  @override
  void initState() {
    selectedList = [];
    super.initState();
    // _scrollController = ScrollController();
  }

  @override
  void dispose() {
    // _scrollController?.dispose();
    super.dispose();
  }

  // bool _onScrollNotification(ScrollNotification notification) {
  //   if (notification is ScrollEndNotification &&
  //       _scrollController!.position.extentAfter == 0) {
  //     context.read<FolderBloc>().add(LoadFolderRecycleBinEvent());
  //   }
  //   return false;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // automaticallyImplyLeading: false,
          title: Text(
        selectedList.isEmpty
            ? 'Recycle Bin'
            : "${selectedList.length} folder selected",
        style: h4StyleLight,
      )),
      body: BlocProvider(
        create: (context) => FolderBloc(RepositoryProvider.of(context))
          ..add(const LoadFolderRecycleBinEvent()),
        child: BlocConsumer<FolderBloc, FolderState>(
          listener: (context, state) {
            if (state is FolderRecyleError) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.error)));
            }
            //  else if (state is FolderRecycleLoading) {
            //   ScaffoldMessenger.of(context).showSnackBar(
            //       const SnackBar(content: Text('Loading folder')));
            // } else if (state is FolderRecycleLoaded &&
            //     state.recycleBin.result!.isEmpty) {
            //   ScaffoldMessenger.of(context).showSnackBar(
            //       const SnackBar(content: Text('No more folder')));
            //   context.read<FolderBloc>().isFetching = false;
            // }
          },
          builder: (context, state) {
            if (state is FolderRecycleLoaded) {
              FolderItemResponse recycleBin = state.recycleBin;
              return RefreshIndicator(
                onRefresh: () async => context.read<FolderBloc>()
                  ..add(const LoadFolderRecycleBinEvent()),
                // child: NotificationListener<ScrollNotification>(
                //   onNotification: (notification) =>
                //       _onScrollNotification(notification),
                child: ListView.builder(
                    // controller: _scrollController,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    primary: false,
                    itemCount: recycleBin.result!.length,
                    itemBuilder: (context, index) {
                      return CardList(
                        isSelected: ((value) {
                          setState(() {
                            if (value) {
                              selectedList.add(recycleBin.result![index]);
                            } else {
                              selectedList.remove(recycleBin.result![index]);
                            }
                          });
                        }),
                        recycleBin: recycleBin.result![index],
                        // onPressed: (r) {},
                      );
                    }),
                // ),
              );
            }

            // if (state is FolderRecyleError) {
            //   return Column(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     crossAxisAlignment: CrossAxisAlignment.center,
            //     children: [
            //       IconButton(
            //         onPressed: () {
            //           context
            //               .read<FolderBloc>()
            //               .add(const LoadFolderRecycleBinEvent());
            //         },
            //         icon: const Icon(Icons.refresh),
            //       ),
            //       const SizedBox(height: 15),
            //       Text(state.error, textAlign: TextAlign.center),
            //     ],
            //   );
            // }
            return Container();
          },
        ),
      ),
    );
  }
}

class CardList extends StatefulWidget {
  const CardList(
      {Key? key,
      required this.recycleBin,
      // this.onPressed,
      required this.isSelected})
      : super(key: key);
  final ValueChanged<bool> isSelected;
  final ResultItemFolder recycleBin;
  // final void Function(ResultItemFolder)? onPressed;

  @override
  State<CardList> createState() => _CardListState();
}

class _CardListState extends State<CardList> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () {},
      onTap: () {
        setState(() {
          isSelected = !isSelected;
          widget.isSelected(isSelected);
        });
      },
      child: Stack(
        children: <Widget>[
          Dismissible(
            key: ValueKey("dismissable-${widget.recycleBin.id}"),
            direction: DismissDirection.endToStart,
            background: Container(
              color: HexColor.fromHex(AppColor.lightBackgroundColor)
                  .withOpacity(1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 100.0,
                    height: double.infinity,
                    child: Icon(
                      Icons.delete,
                      color: HexColor.fromHex(AppColor.primaryBtnColor),
                      size: 40.0,
                    ),
                  )
                ],
              ),
            ),
            confirmDismiss: (_) async {
              final result = showConfimation(context,
                  title: "Are you sure?",
                  content: " Do you want to delete ${widget.recycleBin.name}?",
                  nameBtn: 'Delete');
              return result;
            },
            onDismissed: (_) {
              if (widget.recycleBin.type == AppConstant.folder) {
                context.read<FolderBloc>().add(
                    DeleteRecycleBinFolderEvent(id: widget.recycleBin.id!));
                context
                    .read<FolderBloc>()
                    .add(const LoadFolderRecycleBinEvent());
              } else {
                context
                    .read<FolderBloc>()
                    .add(DeleteRecycleBinFileEvent(id: widget.recycleBin.id!));
                context
                    .read<FolderBloc>()
                    .add(const LoadFolderRecycleBinEvent());
              }
            },
            child: Card(
              color: isSelected ? Colors.grey.withOpacity(0.5) : Colors.white,
              child: ListTile(
                leading: iconType(widget.recycleBin.type!),
                title: Text(widget.recycleBin.name!),
                trailing: PopupMenuButton(
                  icon: const Icon(Icons.more_vert_outlined),
                  itemBuilder: (context) => [
                    PopupMenuItem(
                        value: 1,
                        child: Row(
                          children: const [
                            Icon(Icons.delete_outline),
                            SizedBox(width: 10),
                            Text('Delete')
                          ],
                        )),
                    PopupMenuItem(
                        value: 2,
                        child: Row(
                          children: const [
                            Icon(Icons.restore_outlined),
                            SizedBox(width: 10),
                            Text('Restore')
                          ],
                        )),
                  ],
                  offset: const Offset(0, 70),
                  elevation: 2,
                  onSelected: (value) {
                    if (value == 1) {
                      if (widget.recycleBin.type == AppConstant.folder) {
                        context.read<FolderBloc>().add(
                            DeleteRecycleBinFolderEvent(
                                id: widget.recycleBin.id!));
                        context
                            .read<FolderBloc>()
                            .add(const LoadFolderRecycleBinEvent());
                      } else {
                        context.read<FolderBloc>().add(
                            DeleteRecycleBinFileEvent(
                                id: widget.recycleBin.id!));
                        context
                            .read<FolderBloc>()
                            .add(const LoadFolderRecycleBinEvent());
                      }
                    } else if (value == 2) {
                      if (widget.recycleBin.type == AppConstant.folder) {
                        context.read<FolderBloc>().add(
                            RestoreRecycleBinFolderEvent(
                                id: widget.recycleBin.id!));
                        context
                            .read<FolderBloc>()
                            .add(const LoadFolderRecycleBinEvent());
                      } else {
                        context.read<FolderBloc>().add(
                            RestoreRecycleBinFileEvent(
                                id: widget.recycleBin.id!));
                        context
                            .read<FolderBloc>()
                            .add(const LoadFolderRecycleBinEvent());
                      }
                    }
                  },
                ),
                subtitle: Text(formatDateTime(widget.recycleBin.lastModified!,
                    hastime: true)),
              ),
            ),
          ),
          isSelected
              ? const Center(
                  child: Icon(
                    Icons.check_outlined,
                    color: Colors.redAccent,
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
