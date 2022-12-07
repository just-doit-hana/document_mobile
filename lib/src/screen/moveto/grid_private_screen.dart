import 'package:document_mobile/app/animation/routes_animation.dart';
import 'package:document_mobile/app/util/app_constant.dart';
import 'package:document_mobile/src/data/model/folder/folder_result_folder.dart';
import 'package:document_mobile/src/screen/folder/foolder_sub_detail_grid_screen.dart';
import 'package:document_mobile/src/screen/moveto/item_list_folder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bussiness/folder/bloc/folder_bloc.dart';
import '../../data/model/folder/folder_item.dart';

class GridPrivateFolder extends StatefulWidget {
  const GridPrivateFolder({Key? key, required this.selectedList})
      : super(key: key);
  final List<ResultItemFolder> selectedList;
  @override
  // ignore: library_private_types_in_public_api
  _GridPrivateFolderState createState() => _GridPrivateFolderState();
}

class _GridPrivateFolderState extends State<GridPrivateFolder> {
  // bool isType = false;
  int? count;

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).orientation == Orientation.landscape) {
      count = 4;
    } else {
      count = 2;
    }
    return BlocProvider(
      create: (context) => FolderBloc(RepositoryProvider.of(context))
        ..add(LoadFolderPrivateEvent()),
      child: BlocListener<FolderBloc, FolderState>(
        listener: (context, state) {
          if (state is FolderPrivateErrorState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.error)));
          }
        },
        child: BlocBuilder<FolderBloc, FolderState>(
          builder: (context, state) {
            if (state is FolderPrivateLoadedState) {
              FolderItemResponse privateFolder = state.privateFolder;
              var newPrivateFolder = privateFolder.result!
                  .where(((element) => element.type == AppConstant.folder))
                  .toList();
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
                            // Container(
                            //     color: Colors.transparent,
                            //     padding: const EdgeInsets.only(top: 10),
                            //     // width: double.infinity,
                            //     child: Row(
                            //       mainAxisAlignment:
                            //           MainAxisAlignment.spaceBetween,
                            //       crossAxisAlignment: CrossAxisAlignment.start,
                            //       children: [
                            //         TextSeachButton(
                            //             onPressed: (() {
                            //               // ShowModalSearchName(context);
                            //             }),
                            //             title: 'Name',
                            //             iconData: Icons.arrow_upward_outlined),
                            //         const TextSeachButton(
                            //             title: 'Label',
                            //             iconData: Icons.arrow_upward_outlined),
                            //         IconButton(
                            //             onPressed: () {
                            //               setState(() {
                            //                 isType = !isType;
                            //               });
                            //             },
                            //             icon: isType
                            //                 ? const Icon(
                            //                     Icons.grid_view_outlined)
                            //                 : const Icon(Icons.list_outlined)),
                            //       ],
                            //     )),
                            GridView.count(
                              shrinkWrap: true,
                              primary: false,
                              crossAxisSpacing: 2,
                              mainAxisSpacing: 3,
                              childAspectRatio: 1.2,
                              physics: const NeverScrollableScrollPhysics(),
                              crossAxisCount: count!,
                              children: List.generate(
                                  newPrivateFolder.length,
                                  (index) => ItemListFolder(
                                      folderItem: newPrivateFolder[index],
                                      onPresedDetail: (() {
                                        if (newPrivateFolder[index].type ==
                                            AppConstant.folder) {
                                          Navigator.of(context).push(
                                              CustomRoutesPage(
                                                  widget:
                                                      FolderSubFolderDetailGrid(
                                                          folderList:
                                                              newPrivateFolder,
                                                          folderId:
                                                              newPrivateFolder[
                                                                      index]
                                                                  .id!,
                                                          idIndex: index)));
                                        } else {
                                          return;
                                        }
                                      }),
                                      isSelected: ((value) {
                                        if (value) {
                                          widget.selectedList
                                              .add(newPrivateFolder[index]);
                                        } else {
                                          widget.selectedList
                                              .remove(newPrivateFolder[index]);
                                        }
                                      }))),
                            )
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
