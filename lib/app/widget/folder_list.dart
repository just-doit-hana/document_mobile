import 'package:document_appmobile/app/animation/routes_animation.dart';
import 'package:document_appmobile/app/util/util.dart';
import 'package:document_appmobile/src/data/model/folder/folder_item.dart';
import 'package:document_appmobile/src/screen/folder/folder_detail_srcreen.dart';
import 'package:flutter/material.dart';

import '../../../app/widget/widget.dart';

// ignore: must_be_immutable
class FolderList extends StatelessWidget {
  const FolderList({
    Key? key,
    required this.folderList,
  }) : super(key: key);
  final FolderItemResponse folderList;

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
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: folderList.result!.length,
        itemBuilder: ((context, index) {
          return Column(
            children: [
              GestureDetector(
                onDoubleTap: () {
                  Navigator.of(context).push(CustomRoutesPage(
                      widget: FolderDetail(
                    id: index,
                    // subFolders: folderList.result,
                  )));
                },
                child: Card(
                    child: ListTile(
                        title: Text(folderList.result![index].name.toString()),
                        // subtitle: Text(formatDateTime(
                        //     '2022-10-27T09:17:46.453697',
                        //     hastime: false)),
                        leading:
                            iconType(folderList.result![index].type.toString()),
                        trailing: ElevatedButton(
                            onPressed: () {
                              ShowModalSearchName(context);
                            },
                            style: ElevatedButton.styleFrom(
                              elevation: 0.0,
                              backgroundColor: Colors.red.withOpacity(0),
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(2),
                                  ),
                                  side: BorderSide(color: Colors.white)),
                            ),
                            child: const Icon(
                              Icons.more_vert_outlined,
                              color: Colors.black54,
                            )))),
              ),
            ],
          );
        }));
  }
}

// ignore: non_constant_identifier_names
Future<dynamic> ShowModalSearchName(BuildContext context) {
  return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (ctx) {
        return Container(
            height: MediaQuery.of(context).size.height * 0.32,
            decoration: BoxDecoration(
                color: HexColor.fromHex(
                    AppColor.lightBackgroundColor), // or some other color
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(25.0),
                    topRight: Radius.circular(25.0))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  flex: 1,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 34, top: 10, bottom: 8),
                    child: Text(
                      'Sort by',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontFamily: AppConstant.poppinsFont,
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: HexColor.fromHex(AppColor.blackTextColor)),
                    ),
                  ),
                ),
                Divider(
                  height: 4,
                  color: HexColor.fromHex(AppColor.grayTextColor),
                ),
                const AppBtnSearchModal(
                    title: 'Name', icon: Icons.arrow_upward_outlined),
                const AppBtnSearchModal(
                    title: 'Last Modified', icon: Icons.arrow_upward_outlined),
                const AppBtnSearchModal(
                    title: 'Label', icon: Icons.arrow_upward_outlined),
                const AppBtnSearchModal(
                    title: 'Member', icon: Icons.arrow_upward_outlined),
              ],
            ));
      });
}

// import 'package:document_appmobile/app/animation/routes_animation.dart';
// import 'package:document_appmobile/app/util/util.dart';
// import 'package:document_appmobile/src/bussiness/folder/bloc/folder_bloc.dart';
// import 'package:document_appmobile/src/data/model/folder/folder.dart';
// import 'package:document_appmobile/src/data/model/folder/folder_item.dart';
// import 'package:document_appmobile/src/screen/folder/folder_detail.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../src/data/repository/folder/folder_repo.dart';

// // ignore: must_be_immutable
// class FolderList extends StatefulWidget {
//   const FolderList({Key? key, required this.folder}) : super(key: key);
//   final Result folder;
//   @override
//   // ignore: library_private_types_in_public_api
//   _FolderListState createState() => _FolderListState();
// }

// class _FolderListState extends State<FolderList> {
//   Widget imgIcon(String iconImage, {double height = 28.0, width = 28.0}) {
//     return Image.asset(
//       '${AppImage.path}/$iconImage',
//       height: height,
//       width: width,
//       fit: BoxFit.cover,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//         create: (context) =>
//             FolderBloc((RepositoryProvider.of<FolderRepository>(context)))
//               ..add(LoadFolderPublicEvent()),
//         child: BlocListener<FolderBloc, FolderState>(
//           listener: (context, state) {
//             if (state is FolderErrorState) {
//               ScaffoldMessenger.of(context)
//                   .showSnackBar(SnackBar(content: Text(state.error)));
//             }
//           },
//           child: BlocBuilder<FolderBloc, FolderState>(
//             builder: (context, state) {
//               if (state is FolderLoadingState) {
//                 return _buildLoading();
//               }
//               if (state is FolderLoadedState) {
//                 Result folderList = state.folder;
//                 return RefreshIndicator(
//                   onRefresh: (() async =>
//                       context.read<FolderBloc>().add(LoadFolderPublicEvent())),
//                   child: ListView.builder(
//                       shrinkWrap: true,
//                       itemCount: folderList.subFolders.length,
//                       itemBuilder: ((context, index) {
//                         return Column(
//                           children: [
//                             GestureDetector(
//                               onDoubleTap: () {
//                                 Navigator.of(context).push(CustomRoutesPage(
//                                     widget: FolderDetail(
//                                   id: index,
//                                   subFolders: folderList,
//                                   // folderItem: data,
//                                 )));
//                               },
//                               child: Card(
//                                   child: ListTile(
//                                       title: Text(
//                                           folderList.subFolders[index].name),
//                                       // subtitle: Text(formatDateTime(
//                                       //     '2022-10-27T09:17:46.453697',
//                                       //     hastime: false)),
//                                       leading: imgIcon(AppImage.iconFolder),
//                                       trailing: ElevatedButton(
//                                           onPressed: () {},
//                                           style: ElevatedButton.styleFrom(
//                                             elevation: 0.0,
//                                             backgroundColor:
//                                                 Colors.red.withOpacity(0),
//                                             shape: const RoundedRectangleBorder(
//                                                 borderRadius: BorderRadius.all(
//                                                   Radius.circular(2),
//                                                 ),
//                                                 side: BorderSide(
//                                                     color: Colors.white)),
//                                           ),
//                                           child: const Icon(
//                                             Icons.more_vert_outlined,
//                                             color: Colors.black54,
//                                           )))),
//                             ),
//                           ],
//                         );
//                       })),
//                 );
//               }
//               return Container();
//             },
//           ),
//         ));
//   }

//   Widget _buildLoading() => const Center(child: CircularProgressIndicator());
// }

// List<ResultItemFolder> data = <ResultItemFolder>[
//   ResultItemFolder(
//       id: "8123161c-d299-4633-a0ad-4103984c5478",
//       name: "task new 2",
//       nameWithExtension: "task new 2",
//       type: "Folder",
//       size: 0,
//       isLocked: false,
//       isShortcut: false,
//       isUploading: false,
//       ownerID: "00c1852f-ef00-4d6f-a07b-c73d2de15a78",
//       accessScope: "Viewer",
//       targetAccessScope: null,
//       lastModified: "2022-11-14T15:11:51.484391",
//       tags: [],
//       isArchived: false,
//       isBackup: false,
//       sharedWith: null),
// ];

// class FolderSubfolder extends StatelessWidget {
//   const FolderSubfolder(this.subfolder, {super.key});

//   final Result subfolder;
//   Widget _buildTile(Result root) {
//     if (root.subFolders.isEmpty) {
//       return ListTile(
//         title: Text(root.name),
//       );
//     }
//     return ExpansionTile(
//       title: Text(root.name),
//       children: root.subFolders.map((child) => _buildTile(child)).toList(),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return _buildTile(subfolder);
//   }
// }
