import 'package:document_mobile/src/screen/moveto/item_list_folder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/animation/routes_animation.dart';

import '../../../app/util/util.dart';
import '../../bussiness/folder/bloc/folder_bloc.dart';
import '../../data/model/folder/folder.dart';
import '../../data/model/folder/folder_item.dart';
import '../../data/model/folder/folder_result_folder.dart';
import '../folder/foolder_sub_detail_grid_screen.dart';

// ignore: must_be_immutable
class GridPublicFolder extends StatefulWidget {
  const GridPublicFolder({
    Key? key,
    required this.selectedList,
  }) : super(key: key);
  final List<ResultItemFolder> selectedList;
  @override
  // ignore: library_private_types_in_public_api
  _GridPublicFolderState createState() => _GridPublicFolderState();
}

class _GridPublicFolderState extends State<GridPublicFolder> {
  @override
  Widget build(BuildContext context) {
    print('TEST 123 ok Recy: ${widget.selectedList.length}');

    return Test(selectedItem: widget.selectedList);
  }
}

class Test extends StatelessWidget {
  const Test({
    Key? key,
    required this.selectedItem,
  }) : super(key: key);

  final List<ResultItemFolder> selectedItem;

  @override
  Widget build(BuildContext context) {
    final int? count;
    if (MediaQuery.of(context).orientation == Orientation.landscape) {
      count = 4;
    } else {
      count = 2;
    }
    return BlocProvider(
      create: (context) => FolderBloc(RepositoryProvider.of(context))
        ..add(LoadFolderPublicEvent()),
      child: BlocConsumer<FolderBloc, FolderState>(
        listener: (context, state) {
          if (state is FolderErrorState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.error)));
          }
        },
        builder: (context, state) {
          if (state is FolderLoadedState) {
            Result folderList = state.folder;
            return RefreshIndicator(
              onRefresh: (() async =>
                  context.read<FolderBloc>()..add(LoadFolderPublicEvent())),
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: BlocProvider(
                  create: (context) =>
                      FolderBloc(RepositoryProvider.of(context))
                        ..add(LoadFolderItemEvent(id: folderList.id)),
                  child: BlocBuilder<FolderBloc, FolderState>(
                    builder: (context, state) {
                      if (state is FolderItemLoaded) {
                        FolderItemResponse? folderItemResponse =
                            state.resultItemFolder;
                        var folderPublic = folderItemResponse!.result!
                            .where((e) => e.type == AppConstant.folder)
                            .toList();

                        return Column(
                          children: <Widget>[
                            // Container(
                            //     color: Colors.transparent,
                            //     padding: const EdgeInsets.only(top: 10),
                            // width: double.infinity,
                            // child: Row(
                            //   mainAxisAlignment:
                            //       MainAxisAlignment.spaceBetween,
                            //   crossAxisAlignment:
                            //       CrossAxisAlignment.start,
                            //   children: [
                            //     TextSeachButton(
                            //         onPressed: (() {
                            //           // ShowModalSearchName(context);
                            //         }),
                            //         title:
                            //             'Name ${selectedItem.length}',
                            //         iconData:
                            //             Icons.arrow_upward_outlined),
                            //     const TextSeachButton(
                            //         title: 'Label',
                            //         iconData:
                            //             Icons.arrow_upward_outlined),
                            //     IconButton(
                            //         onPressed: () {
                            //           setState(() {
                            //             isType = !isType;
                            //           });
                            //         },
                            //         icon: isType
                            //             ? const Icon(
                            //                 Icons.grid_view_outlined)
                            //             : const Icon(
                            //                 Icons.list_outlined)),
                            //   ],
                            // )),
                            GridView.count(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              crossAxisCount: count!,
                              primary: false,
                              crossAxisSpacing: 2,
                              mainAxisSpacing: 3,
                              childAspectRatio: 1.2,
                              children:
                                  List.generate(folderPublic.length, (index) {
                                return ItemListFolder(
                                    folderItem: folderPublic[index],
                                    onPresedDetail: (() {
                                      if (folderPublic[index].type ==
                                          AppConstant.folder) {
                                        Navigator.of(context).push(
                                            CustomRoutesPage(
                                                widget:
                                                    FolderSubFolderDetailGrid(
                                                        folderList:
                                                            folderPublic,
                                                        idIndex: index,
                                                        folderId:
                                                            folderPublic[index]
                                                                .id!)));
                                      } else {
                                        return;
                                      }
                                    }),
                                    isSelected: ((value) {
                                      if (value) {
                                        selectedItem.add(folderPublic[index]);
                                      } else {
                                        selectedItem
                                            .remove(folderPublic[index]);
                                      }
                                    }));
                              }),
                            )
                          ],
                        );
                      }
                      return Container();
                    },
                  ),
                ),
              ),
            );
          }
          return Container();
        },
        // ),
        // );
        // },
      ),
    );
  }
}
