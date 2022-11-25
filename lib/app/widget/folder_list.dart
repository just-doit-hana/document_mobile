import 'package:document_mobile/src/screen/files/file_detail.dart';
import 'package:flutter/material.dart';

import '../../../app/widget/widget.dart';
import '../../src/data/model/folder/folder_item.dart';
import '../../src/screen/folder/folder_detail_srcreen.dart';
import '../animation/routes_animation.dart';
import '../util/util.dart';

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
                        leading:
                            iconType(folderList.result![index].type.toString()),
                        trailing: ElevatedButton(
                            onPressed: () {
                              showModalBottomSheet(
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
                                              flex: 2,
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
                                                      const Icon(Icons.folder),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(left: 11),
                                                        child: Text(
                                                          'Document guide',
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
                                                ListTitleModal(
                                                  onPress: () {},
                                                  icon: Icons.preview_outlined,
                                                  content: 'Preview',
                                                ),
                                                ListTitleModal(
                                                  onPress: () {
                                                    Navigator.of(context)
                                                        .push(CustomRoutesPage(
                                                            widget: FileDetail(
                                                      fileId: folderList
                                                          .result![index].id
                                                          .toString(),
                                                    )));
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
                                                  onPress: () {},
                                                  icon:
                                                      Icons.file_copy_outlined,
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
                                                            // contentPadding:
                                                            //     const EdgeInsets
                                                            //         .symmetric(
                                                            //   vertical: 50.0,
                                                            // ),
                                                            // insetPadding:
                                                            //     const EdgeInsets
                                                            //         .symmetric(
                                                            //   vertical: 50.0,
                                                            // ),
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
                                                  onPress: () {},
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
                                                  icon:
                                                      Icons.lock_open_outlined,
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
                                  });
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

Future<dynamic> showModalSearchName(BuildContext context) {
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
