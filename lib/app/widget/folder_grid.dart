import 'package:document_mobile/src/screen/folder/foolder_sub_detail_list_screen.dart';
import 'package:flutter/material.dart';

import '../../src/data/model/folder/folder_result_folder.dart';
import '../../src/screen/copyto/copyto_screen.dart';
import '../../src/screen/files/file_detail.dart';
import '../../src/screen/folder/folder_detail_sceen.dart';
import '../../src/screen/folder/foolder_sub_detail_grid_screen.dart';
import '../../src/screen/moveto/moveto_screen.dart';
import '../../src/screen/previewer/sysnfusion.dart';
import '../animation/routes_animation.dart';
import '../util/util.dart';
import 'icon_type.dart';
import 'list_title.dart';

// ignore: must_be_immutable
class FolderGrid extends StatelessWidget {
  FolderGrid({
    Key? key,
    required this.folderGrid,
  }) : super(key: key);
  final List<ResultItemFolder>? folderGrid;
  int? count;
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
    if (MediaQuery.of(context).orientation == Orientation.landscape) {
      count = 4;
    } else {
      count = 2;
    }
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: count!,
      primary: false,
      crossAxisSpacing: 2,
      mainAxisSpacing: 3,
      childAspectRatio: 1.2,
      children: List.generate(folderGrid!.length, (index) {
        return GestureDetector(
          onDoubleTap: (() {
            if (folderGrid![index].type == 'Folder') {
              Navigator.of(context).push(CustomRoutesPage(
                  widget: FolderSubFolderDetailGrid(
                      folderList: folderGrid,
                      idIndex: index,
                      folderId: folderGrid![index].id!)));
            } else {
              return;
            }
          }),
          child: Card(
            color: Colors.transparent,
            shadowColor: Colors.transparent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    child: iconType(folderGrid![index].type.toString(),
                        height: 70.0, width: 70.0)),
                SizedBox(
                  width: double.infinity,
                  // color: Colors.red,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 0),
                          child: Text(
                            folderGrid![index].name.toString(),
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            softWrap: false,
                            style: TextStyle(
                              fontSize: 14,
                              color: HexColor.fromHex(AppColor.blackTextColor),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            (showModalBottomSheet(
                                isDismissible: true,
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                context: context,
                                builder: (ctx) {
                                  return Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.8,
                                      decoration: BoxDecoration(
                                          color: HexColor.fromHex(AppColor
                                              .lightBackgroundColor), // or some other color
                                          borderRadius: const BorderRadius.only(
                                              topLeft: Radius.circular(25.0),
                                              topRight: Radius.circular(25.0))),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Flexible(
                                            flex: 2,
                                            child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 18,
                                                    top: 10,
                                                    bottom: 10),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      child: folderGrid![index]
                                                                  .type ==
                                                              'Folder'
                                                          ? imgIcon(AppImage
                                                              .iconFolder)
                                                          : iconType(
                                                              folderGrid![index]
                                                                  .type
                                                                  .toString()),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 11),
                                                      child: Text(
                                                        folderGrid![index]
                                                            .name
                                                            .toString(),
                                                        textAlign:
                                                            TextAlign.start,
                                                        style: TextStyle(
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            fontFamily:
                                                                AppConstant
                                                                    .poppinsFont,
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.w400,
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
                                              ListTitleModal(
                                                onPress: () {
                                                  if (folderGrid![index].type ==
                                                      'Folder') {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(SnackBar(
                                                            backgroundColor:
                                                                const Color
                                                                        .fromARGB(
                                                                    255,
                                                                    226,
                                                                    223,
                                                                    223),
                                                            content: Text(
                                                              'Can not view fodler',
                                                              style: TextStyle(
                                                                  color: HexColor
                                                                      .fromHex(
                                                                          AppColor
                                                                              .primaryTextColor)),
                                                            )));
                                                  } else {
                                                    Navigator.of(context)
                                                        .push(CustomRoutesPage(
                                                            widget: Sysnfusion(
                                                      fileId: folderGrid![index]
                                                          .id!,
                                                    )));
                                                  }
                                                },
                                                icon: Icons.preview_outlined,
                                                content: 'Preview',
                                              ),
                                              ListTitleModal(
                                                onPress: () {
                                                  if (folderGrid![index].type ==
                                                      'Folder') {
                                                    Navigator.of(context).push(
                                                        CustomRoutesPage(
                                                            widget:
                                                                FolderViewDetail(
                                                      folderId:
                                                          folderGrid![index]
                                                              .id
                                                              .toString(),
                                                    )));
                                                  } else {
                                                    Navigator.of(context)
                                                        .push(CustomRoutesPage(
                                                            widget: FileDetail(
                                                      fileId: folderGrid![index]
                                                          .id
                                                          .toString(),
                                                    )));
                                                  }
                                                },
                                                icon: Icons.info_outlined,
                                                content: 'View Details',
                                              ),
                                              ListTitleModal(
                                                onPress: () {},
                                                icon: Icons.update_outlined,
                                                content: 'Update Version',
                                              ),
                                              Divider(
                                                height: 4,
                                                color: HexColor.fromHex(
                                                    AppColor.grayTextColor),
                                              ),
                                              ListTitleModal(
                                                onPress: () {},
                                                icon: Icons.download_outlined,
                                                content: 'Download',
                                              ),
                                              ListTitleModal(
                                                onPress: () {
                                                  Navigator.of(context).push(
                                                      CustomRoutesPage(
                                                          widget:
                                                              const CopytoScreen()));
                                                },
                                                icon: Icons.file_copy_outlined,
                                                content: 'Copy To',
                                              ),
                                              ListTitleModal(
                                                onPress: () {
                                                  showDialog(
                                                      context: context,
                                                      builder: ((context) {
                                                        return AlertDialog(
                                                          shape: const RoundedRectangleBorder(
                                                              borderRadius: BorderRadius
                                                                  .all(Radius
                                                                      .circular(
                                                                          10.0))),
                                                          title: const Text(
                                                              'Rename folder'),
                                                          content: SizedBox(
                                                            width: 400.0,
                                                            // color: Colors
                                                            //     .redAccent,
                                                            height: 50,
                                                            child: TextField(
                                                              autofocus: true,
                                                              keyboardType:
                                                                  TextInputType
                                                                      .text,
                                                              decoration: InputDecoration(
                                                                  filled: true,
                                                                  // fillColor:
                                                                  //     Colors
                                                                  //         .amberAccent,
                                                                  border: OutlineInputBorder(
                                                                      // borderSide: const BorderSide(
                                                                      //     color: Colors
                                                                      //         .amberAccent,
                                                                      //     width:
                                                                      //         1.0),
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
                                                                    child: const Text(
                                                                        'Cancel')),
                                                                TextButton(
                                                                    onPressed:
                                                                        () {},
                                                                    child: const Text(
                                                                        'Rename'))
                                                              ],
                                                            )
                                                          ],
                                                        );
                                                      }));
                                                },
                                                icon: Icons
                                                    .drive_file_rename_outline,
                                                content: 'Rename',
                                              ),
                                              ListTitleModal(
                                                onPress: () {
                                                  Navigator.of(context).push(
                                                      CustomRoutesPage(
                                                          widget:
                                                              const MovetoScreen()));
                                                },
                                                icon: Icons.move_up_outlined,
                                                content: 'Move To',
                                              ),
                                              Divider(
                                                height: 4,
                                                color: HexColor.fromHex(
                                                    AppColor.grayTextColor),
                                              ),
                                              ListTitleModal(
                                                onPress: () {},
                                                icon: Icons.backup_outlined,
                                                content: 'Back up',
                                              ),
                                              ListTitleModal(
                                                onPress: () {},
                                                icon: Icons.share,
                                                content: 'Share',
                                              ),
                                              ListTitleModal(
                                                onPress: () {},
                                                icon: Icons.lock_open_outlined,
                                                content: 'Lock/UnLock',
                                              ),
                                              ListTitleModal(
                                                onPress: () {},
                                                icon: Icons.delete_outline,
                                                content: 'Delete',
                                              ),
                                            ],
                                          )
                                        ],
                                      ));
                                }));
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 0.0,
                            backgroundColor: Colors.red.withOpacity(0),
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(2),
                                ),
                                side: BorderSide(color: Colors.transparent)),
                          ),
                          child: const Icon(
                            Icons.more_vert_outlined,
                            color: Colors.black45,
                          )),
                    ],
                  ),
                )
              ],
            ),
            // ),
          ),
        );
      }),
    );
  }
}
