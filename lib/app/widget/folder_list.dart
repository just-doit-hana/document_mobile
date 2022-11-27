import 'package:document_mobile/src/screen/copyto/copyto_screen.dart';
import 'package:document_mobile/src/screen/files/file_detail.dart';
import 'package:document_mobile/src/screen/folder/foolder_sub_detail_list_screen.dart';
import 'package:document_mobile/src/screen/moveto/moveto_screen.dart';
import 'package:flutter/material.dart';

import '../../../app/widget/widget.dart';
import '../../src/data/model/folder/folder_item.dart';
import '../../src/screen/previewer/sysnfusion.dart';
import '../../src/screen/folder/folder_detail_sceen.dart';
import '../animation/routes_animation.dart';
import '../util/util.dart';

// ignore: must_be_immutable
class FolderList extends StatelessWidget {
  FolderList({Key? key, required this.folderList}) : super(key: key);
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
          var owner =
              (folderList.result![index].accessScope == AppConstant.owner);
          var viewer =
              (folderList.result![index].accessScope == AppConstant.viewer);
          var editor =
              (folderList.result![index].accessScope == AppConstant.editor);

          return Column(
            children: [
              GestureDetector(
                onDoubleTap: () {
                  if (folderList.result![index].type == AppConstant.folder) {
                    Navigator.of(context).push(CustomRoutesPage(
                        widget: FolderSubFolderDetailList(
                            folderList: folderList,
                            idIndex: index,
                            folderId: folderList.result![index].id!)));
                  } else {
                    return;
                  }
                },
                child: Card(
                    child: ListTile(
                        title: Text(folderList.result![index].name.toString()),
                        leading:
                            iconType(folderList.result![index].type.toString()),
                        trailing: ElevatedButton(
                            onPressed: () {
                              showModalBottomSheet(
                                  isDismissible: true,
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  context: context,
                                  builder: (ctx) {
                                    return Container(
                                        constraints: BoxConstraints(
                                          maxHeight: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              4.0 *
                                              3.0,
                                        ),
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.8,
                                        decoration: BoxDecoration(
                                            color: HexColor.fromHex(AppColor
                                                .lightBackgroundColor), // or some other color
                                            borderRadius:
                                                const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(25.0),
                                                    topRight:
                                                        Radius.circular(25.0))),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Flexible(
                                              flex: 1,
                                              child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 18,
                                                          top: 10,
                                                          bottom: 10),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Container(
                                                        child: folderList
                                                                    .result![
                                                                        index]
                                                                    .type ==
                                                                AppConstant
                                                                    .folder
                                                            ? imgIcon(AppImage
                                                                .iconFolder)
                                                            : iconType(folderList
                                                                .result![index]
                                                                .type
                                                                .toString()),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(left: 11),
                                                        child: Text(
                                                          folderList
                                                              .result![index]
                                                              .name
                                                              .toString(),
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  AppConstant
                                                                      .poppinsFont,
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color: HexColor
                                                                  .fromHex(AppColor
                                                                      .blackTextColor)),
                                                        ),
                                                      ),
                                                    ],
                                                  )),
                                            ),
                                            Divider(
                                              height: 4,
                                              color: HexColor.fromHex(
                                                  AppColor.grayTextColor),
                                            ),
                                            Wrap(
                                              children: [
                                                owner || viewer || editor
                                                    ? (ListTitleModal(
                                                        onPress: () {
                                                          if (folderList
                                                                  .result![
                                                                      index]
                                                                  .type ==
                                                              AppConstant
                                                                  .folder) {
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                                    SnackBar(
                                                                        backgroundColor: const Color.fromARGB(
                                                                            255,
                                                                            226,
                                                                            223,
                                                                            223),
                                                                        content:
                                                                            Text(
                                                                          'Can not view fodler',
                                                                          style:
                                                                              TextStyle(color: HexColor.fromHex(AppColor.primaryTextColor)),
                                                                        )));
                                                          } else {
                                                            Navigator.of(context).push(
                                                                CustomRoutesPage(
                                                                    widget:
                                                                        Sysnfusion(
                                                              fileId: folderList
                                                                  .result![
                                                                      index]
                                                                  .id!,
                                                            )));
                                                          }
                                                        },
                                                        icon: Icons
                                                            .preview_outlined,
                                                        content: 'Preview',
                                                      ))
                                                    : (Container()),
                                                owner || viewer || editor
                                                    ? (ListTitleModal(
                                                        onPress: () {
                                                          if (folderList
                                                                  .result![
                                                                      index]
                                                                  .type ==
                                                              AppConstant
                                                                  .folder) {
                                                            Navigator.of(context).push(
                                                                CustomRoutesPage(
                                                                    widget:
                                                                        FolderViewDetail(
                                                              folderId: folderList
                                                                  .result![
                                                                      index]
                                                                  .id
                                                                  .toString(),
                                                            )));
                                                          } else {
                                                            Navigator.of(context).push(
                                                                CustomRoutesPage(
                                                                    widget:
                                                                        FileDetail(
                                                              fileId: folderList
                                                                  .result![
                                                                      index]
                                                                  .id
                                                                  .toString(),
                                                            )));
                                                          }
                                                        },
                                                        icon:
                                                            Icons.info_outlined,
                                                        content: 'View Details',
                                                      ))
                                                    : (Container()),
                                                owner
                                                    ? (ListTitleModal(
                                                        onPress: () {},
                                                        icon: Icons
                                                            .update_outlined,
                                                        content:
                                                            'Update Version',
                                                      ))
                                                    : (Container()),
                                                Divider(
                                                  height: 4,
                                                  color: HexColor.fromHex(
                                                      AppColor.grayTextColor),
                                                ),
                                                owner || viewer || editor
                                                    ? (ListTitleModal(
                                                        onPress: () {},
                                                        icon: Icons
                                                            .download_outlined,
                                                        content: 'Download',
                                                      ))
                                                    : (Container()),
                                                owner
                                                    ? (ListTitleModal(
                                                        onPress: () {
                                                          Navigator.of(context).push(
                                                              CustomRoutesPage(
                                                                  widget:
                                                                      const CopytoScreen()));
                                                        },
                                                        icon: Icons
                                                            .file_copy_outlined,
                                                        content: 'Copy To',
                                                      ))
                                                    : Container(),
                                                owner || editor
                                                    ? (ListTitleModal(
                                                        onPress: () {
                                                          showDialog(
                                                              context: context,
                                                              builder:
                                                                  ((context) {
                                                                return AlertDialog(
                                                                  shape: const RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.all(
                                                                              Radius.circular(10.0))),
                                                                  title: const Text(
                                                                      'Rename folder'),
                                                                  content:
                                                                      SizedBox(
                                                                    width:
                                                                        400.0,
                                                                    height: 50,
                                                                    child:
                                                                        TextField(
                                                                      autofocus:
                                                                          true,
                                                                      keyboardType:
                                                                          TextInputType
                                                                              .text,
                                                                      decoration: InputDecoration(
                                                                          filled:
                                                                              true,
                                                                          border: OutlineInputBorder(
                                                                              borderSide: BorderSide.none,
                                                                              borderRadius: BorderRadius.circular(8.0))),
                                                                    ),
                                                                  ),
                                                                  actions: [
                                                                    Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .end,
                                                                      children: [
                                                                        TextButton(
                                                                            onPressed:
                                                                                () {},
                                                                            child:
                                                                                const Text('Cancel')),
                                                                        TextButton(
                                                                            onPressed:
                                                                                () {},
                                                                            child:
                                                                                const Text('Rename'))
                                                                      ],
                                                                    )
                                                                  ],
                                                                );
                                                              }));
                                                        },
                                                        icon: Icons
                                                            .drive_file_rename_outline,
                                                        content: 'Rename',
                                                      ))
                                                    : (Container()),
                                                owner
                                                    ? (ListTitleModal(
                                                        onPress: () {
                                                          Navigator.of(context).push(
                                                              CustomRoutesPage(
                                                                  widget:
                                                                      const MovetoScreen()));
                                                        },
                                                        icon: Icons
                                                            .move_up_outlined,
                                                        content: 'Move To',
                                                      ))
                                                    : Container(),
                                                Divider(
                                                  height: 4,
                                                  color: HexColor.fromHex(
                                                      AppColor.grayTextColor),
                                                ),
                                                owner
                                                    ? (ListTitleModal(
                                                        onPress: () {},
                                                        icon: Icons
                                                            .backup_outlined,
                                                        content: 'Back up',
                                                      ))
                                                    : Container(),
                                                owner
                                                    ? (ListTitleModal(
                                                        onPress: () {},
                                                        icon: Icons.share,
                                                        content: 'Share',
                                                      ))
                                                    : Container(),
                                                owner
                                                    ? (ListTitleModal(
                                                        onPress: () {},
                                                        icon: Icons
                                                            .lock_open_outlined,
                                                        content: 'Lock/UnLock',
                                                      ))
                                                    : (Container()),
                                                owner
                                                    ? (ListTitleModal(
                                                        onPress: () {},
                                                        icon: Icons
                                                            .delete_outline,
                                                        content: 'Delete',
                                                      ))
                                                    : (Container()),
                                              ],
                                            )
                                          ],
                                        ));
                                  });

                              // showModalBottomSheet(
                              //     context: context,
                              //     backgroundColor: Colors.transparent,
                              //     isScrollControlled: true,
                              //     builder: (context) {
                              //       return FractionallySizedBox(
                              //         heightFactor: 0.8,
                              //         child: ClipRRect(
                              //           borderRadius: const BorderRadius.only(
                              //               topLeft: Radius.circular(10),
                              //               topRight: Radius.circular(10)),
                              //           clipBehavior: Clip.hardEdge,
                              //           child: Container(
                              //             decoration: const BoxDecoration(
                              //               color: Colors.white,
                              //               borderRadius: BorderRadius.only(
                              //                 topLeft: Radius.circular(10),
                              //                 topRight: Radius.circular(10),
                              //               ),
                              //             ),
                              //             child: DraggableScrollableSheet(
                              //               initialChildSize: 1,
                              //               minChildSize: 0.95,
                              //               builder: (BuildContext context,
                              //                   ScrollController
                              //                       scrollController) {
                              //                 return SingleChildScrollView(
                              //                     controller: scrollController,
                              //                     child: Container(
                              //                         height:
                              //                             MediaQuery.of(context)
                              //                                     .size
                              //                                     .height *
                              //                                 0.4,
                              //                         alignment:
                              //                             Alignment.topCenter,
                              //                         child: Column(
                              //                           crossAxisAlignment:
                              //                               CrossAxisAlignment
                              //                                   .start,
                              //                           children: [
                              //                             Flexible(
                              //                               flex: 1,
                              //                               child: Padding(
                              //                                   padding:
                              //                                       const EdgeInsets
                              //                                               .only(
                              //                                           left:
                              //                                               18,
                              //                                           top: 10,
                              //                                           bottom:
                              //                                               10),
                              //                                   child: Row(
                              //                                     mainAxisAlignment:
                              //                                         MainAxisAlignment
                              //                                             .start,
                              //                                     children: [
                              //                                       Container(
                              //                                         child: folderList.result![index].type ==
                              //                                                 AppConstant
                              //                                                     .folder
                              //                                             ? imgIcon(AppImage
                              //                                                 .iconFolder)
                              //                                             : iconType(folderList
                              //                                                 .result![index]
                              //                                                 .type
                              //                                                 .toString()),
                              //                                       ),
                              //                                       Padding(
                              //                                         padding: const EdgeInsets
                              //                                                 .only(
                              //                                             left:
                              //                                                 11),
                              //                                         child:
                              //                                             Text(
                              //                                           folderList
                              //                                               .result![index]
                              //                                               .name
                              //                                               .toString(),
                              //                                           maxLines:
                              //                                               1,
                              //                                           overflow:
                              //                                               TextOverflow.ellipsis,
                              //                                           style: TextStyle(
                              //                                               fontFamily: AppConstant
                              //                                                   .poppinsFont,
                              //                                               fontSize:
                              //                                                   18,
                              //                                               fontWeight:
                              //                                                   FontWeight.w400,
                              //                                               color: HexColor.fromHex(AppColor.blackTextColor)),
                              //                                         ),
                              //                                       ),
                              //                                     ],
                              //                                   )),
                              //                             ),
                              //                             Divider(
                              //                               height: 4,
                              //                               color: HexColor
                              //                                   .fromHex(AppColor
                              //                                       .grayTextColor),
                              //                             ),
                              //                             Wrap(
                              //                               children: [
                              //                                 owner ||
                              //                                         viewer ||
                              //                                         editor
                              //                                     ? (ListTitleModal(
                              //                                         onPress:
                              //                                             () {
                              //                                           if (folderList.result![index].type ==
                              //                                               AppConstant.folder) {
                              //                                             ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              //                                                 backgroundColor: const Color.fromARGB(255, 226, 223, 223),
                              //                                                 content: Text(
                              //                                                   'Can not view fodler',
                              //                                                   style: TextStyle(color: HexColor.fromHex(AppColor.primaryTextColor)),
                              //                                                 )));
                              //                                           } else {
                              //                                             Navigator.of(context).push(CustomRoutesPage(
                              //                                                 widget: Sysnfusion(
                              //                                               fileId:
                              //                                                   folderList.result![index].id!,
                              //                                             )));
                              //                                           }
                              //                                         },
                              //                                         icon: Icons
                              //                                             .preview_outlined,
                              //                                         content:
                              //                                             'Preview',
                              //                                       ))
                              //                                     : (Container()),
                              //                                 owner ||
                              //                                         viewer ||
                              //                                         editor
                              //                                     ? (ListTitleModal(
                              //                                         onPress:
                              //                                             () {
                              //                                           if (folderList.result![index].type ==
                              //                                               AppConstant.folder) {
                              //                                             Navigator.of(context).push(CustomRoutesPage(
                              //                                                 widget: FolderViewDetail(
                              //                                               folderId:
                              //                                                   folderList.result![index].id.toString(),
                              //                                             )));
                              //                                           } else {
                              //                                             Navigator.of(context).push(CustomRoutesPage(
                              //                                                 widget: FileDetail(
                              //                                               fileId:
                              //                                                   folderList.result![index].id.toString(),
                              //                                             )));
                              //                                           }
                              //                                         },
                              //                                         icon: Icons
                              //                                             .info_outlined,
                              //                                         content:
                              //                                             'View Details',
                              //                                       ))
                              //                                     : (Container()),
                              //                                 owner
                              //                                     ? (ListTitleModal(
                              //                                         onPress:
                              //                                             () {},
                              //                                         icon: Icons
                              //                                             .update_outlined,
                              //                                         content:
                              //                                             'Update Version',
                              //                                       ))
                              //                                     : (Container()),
                              //                                 Divider(
                              //                                   height: 4,
                              //                                   color: HexColor
                              //                                       .fromHex(
                              //                                           AppColor
                              //                                               .grayTextColor),
                              //                                 ),
                              //                                 owner ||
                              //                                         viewer ||
                              //                                         editor
                              //                                     ? (ListTitleModal(
                              //                                         onPress:
                              //                                             () {},
                              //                                         icon: Icons
                              //                                             .download_outlined,
                              //                                         content:
                              //                                             'Download',
                              //                                       ))
                              //                                     : (Container()),
                              //                                 owner
                              //                                     ? (ListTitleModal(
                              //                                         onPress:
                              //                                             () {
                              //                                           Navigator.of(context).push(CustomRoutesPage(
                              //                                               widget:
                              //                                                   const CopytoScreen()));
                              //                                         },
                              //                                         icon: Icons
                              //                                             .file_copy_outlined,
                              //                                         content:
                              //                                             'Copy To',
                              //                                       ))
                              //                                     : Container(),
                              //                                 owner || editor
                              //                                     ? (ListTitleModal(
                              //                                         onPress:
                              //                                             () {
                              //                                           showDialog(
                              //                                               context:
                              //                                                   context,
                              //                                               builder:
                              //                                                   ((context) {
                              //                                                 return AlertDialog(
                              //                                                   shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
                              //                                                   title: const Text('Rename folder'),
                              //                                                   content: SizedBox(
                              //                                                     width: 400.0,
                              //                                                     height: 50,
                              //                                                     child: TextField(
                              //                                                       autofocus: true,
                              //                                                       keyboardType: TextInputType.text,
                              //                                                       decoration: InputDecoration(filled: true, border: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(8.0))),
                              //                                                     ),
                              //                                                   ),
                              //                                                   actions: [
                              //                                                     Row(
                              //                                                       mainAxisAlignment: MainAxisAlignment.end,
                              //                                                       children: [
                              //                                                         TextButton(onPressed: () {}, child: const Text('Cancel')),
                              //                                                         TextButton(onPressed: () {}, child: const Text('Rename'))
                              //                                                       ],
                              //                                                     )
                              //                                                   ],
                              //                                                 );
                              //                                               }));
                              //                                         },
                              //                                         icon: Icons
                              //                                             .drive_file_rename_outline,
                              //                                         content:
                              //                                             'Rename',
                              //                                       ))
                              //                                     : (Container()),
                              //                                 owner
                              //                                     ? (ListTitleModal(
                              //                                         onPress:
                              //                                             () {
                              //                                           Navigator.of(context).push(CustomRoutesPage(
                              //                                               widget:
                              //                                                   const MovetoScreen()));
                              //                                         },
                              //                                         icon: Icons
                              //                                             .move_up_outlined,
                              //                                         content:
                              //                                             'Move To',
                              //                                       ))
                              //                                     : Container(),
                              //                                 Divider(
                              //                                   height: 4,
                              //                                   color: HexColor
                              //                                       .fromHex(
                              //                                           AppColor
                              //                                               .grayTextColor),
                              //                                 ),
                              //                                 owner
                              //                                     ? (ListTitleModal(
                              //                                         onPress:
                              //                                             () {},
                              //                                         icon: Icons
                              //                                             .backup_outlined,
                              //                                         content:
                              //                                             'Back up',
                              //                                       ))
                              //                                     : Container(),
                              //                                 owner
                              //                                     ? (ListTitleModal(
                              //                                         onPress:
                              //                                             () {},
                              //                                         icon: Icons
                              //                                             .share,
                              //                                         content:
                              //                                             'Share',
                              //                                       ))
                              //                                     : Container(),
                              //                                 owner
                              //                                     ? (ListTitleModal(
                              //                                         onPress:
                              //                                             () {},
                              //                                         icon: Icons
                              //                                             .lock_open_outlined,
                              //                                         content:
                              //                                             'Lock/UnLock',
                              //                                       ))
                              //                                     : (Container()),
                              //                                 owner
                              //                                     ? (ListTitleModal(
                              //                                         onPress:
                              //                                             () {},
                              //                                         icon: Icons
                              //                                             .delete_outline,
                              //                                         content:
                              //                                             'Delete',
                              //                                       ))
                              //                                     : (Container()),
                              //                               ],
                              //                             )
                              //                           ],
                              //                         )));
                              //               },
                              //             ),
                              //           ),
                              //         ),
                              //       );
                              //     });
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

// Future<dynamic> showModalSearchName(BuildContext context) {
//   return showModalBottomSheet(
//       isScrollControlled: true,
//       backgroundColor: Colors.transparent,
//       context: context,
//       builder: (ctx) {
//         return Container(
//             height: MediaQuery.of(context).size.height * 0.32,
//             decoration: BoxDecoration(
//                 color: HexColor.fromHex(
//                     AppColor.lightBackgroundColor), // or some other color
//                 borderRadius: const BorderRadius.only(
//                     topLeft: Radius.circular(25.0),
//                     topRight: Radius.circular(25.0))),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Flexible(
//                   flex: 1,
//                   child: Padding(
//                     padding:
//                         const EdgeInsets.only(left: 34, top: 10, bottom: 8),
//                     child: Text(
//                       'Sort by',
//                       textAlign: TextAlign.start,
//                       style: TextStyle(
//                           fontFamily: AppConstant.poppinsFont,
//                           fontSize: 18,
//                           fontWeight: FontWeight.w400,
//                           color: HexColor.fromHex(AppColor.blackTextColor)),
//                     ),
//                   ),
//                 ),
//                 Divider(
//                   height: 4,
//                   color: HexColor.fromHex(AppColor.grayTextColor),
//                 ),
//                 const AppBtnSearchModal(
//                     title: 'Name', icon: Icons.arrow_upward_outlined),
//                 const AppBtnSearchModal(
//                     title: 'Last Modified', icon: Icons.arrow_upward_outlined),
//                 const AppBtnSearchModal(
//                     title: 'Label', icon: Icons.arrow_upward_outlined),
//                 const AppBtnSearchModal(
//                     title: 'Member', icon: Icons.arrow_upward_outlined),
//               ],
//             ));
//       });
// }
