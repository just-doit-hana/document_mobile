import 'package:document_mobile/src/bussiness/file/bloc/file_bloc.dart';
import 'package:document_mobile/src/bussiness/folder/bloc/folder_bloc.dart';
import 'package:document_mobile/src/data/model/file/file_rename.dart';
import 'package:document_mobile/src/screen/copyto/copyto_screen.dart';
import 'package:document_mobile/src/screen/files/file_detail.dart';
import 'package:document_mobile/src/screen/folder/foolder_sub_detail_list_screen.dart';
import 'package:document_mobile/src/screen/moveto/moveto_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/widget/widget.dart';
import '../../src/data/model/folder/folder_item.dart';
import '../../src/screen/previewer/sysnfusion.dart';
import '../../src/screen/folder/folder_detail_sceen.dart';
import '../../src/screen/shared/shared_screen.dart';
import '../animation/routes_animation.dart';
import '../util/util.dart';
import 'app_dialogs.dart';

// ignore: must_be_immutable
class FolderList extends StatefulWidget {
  const FolderList({Key? key, required this.folderList}) : super(key: key);
  final FolderItemResponse folderList;

  @override
  State<FolderList> createState() => _FolderListState();
}

class _FolderListState extends State<FolderList> {
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
    TextEditingController controllerFile = TextEditingController();
    TextEditingController controllerFolder = TextEditingController();
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: widget.folderList.result!.length,
        itemBuilder: ((context, index) {
          var owner =
              widget.folderList.result![index].accessScope == AppConstant.owner;
          var viewer = widget.folderList.result![index].accessScope ==
              AppConstant.viewer;
          var editor = widget.folderList.result![index].accessScope ==
              AppConstant.editor;
          var listIdTags = [];
          widget.folderList.result![index].tags!.forEach(((element) {
            listIdTags.add(element.id);
          }));
          return Column(
            children: [
              GestureDetector(
                onDoubleTap: () {
                  if (widget.folderList.result![index].type ==
                      AppConstant.folder) {
                    Navigator.of(context).push(CustomRoutesPage(
                        widget: FolderSubFolderDetailList(
                            folderList: widget.folderList,
                            idIndex: index,
                            folderId: widget.folderList.result![index].id!)));
                  } else {
                    return;
                  }
                },
                child: Card(
                    child: ListTile(
                  title: Text(widget.folderList.result![index].name.toString()),
                  leading: iconType(
                      widget.folderList.result![index].type.toString()),
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
                                    maxHeight:
                                        MediaQuery.of(context).size.height /
                                            4.0 *
                                            3.0,
                                  ),
                                  height:
                                      MediaQuery.of(context).size.height * 0.8,
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
                                        flex: 1,
                                        child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 18, top: 10, bottom: 10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Container(
                                                  child: widget
                                                              .folderList
                                                              .result![index]
                                                              .type ==
                                                          AppConstant.folder
                                                      ? imgIcon(
                                                          AppImage.iconFolder)
                                                      : iconType(widget
                                                          .folderList
                                                          .result![index]
                                                          .type
                                                          .toString()),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 11),
                                                  child: Text(
                                                    widget.folderList
                                                        .result![index].name
                                                        .toString(),
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                        fontFamily: AppConstant
                                                            .poppinsFont,
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: HexColor.fromHex(
                                                            AppColor
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
                                                    if (widget
                                                            .folderList
                                                            .result![index]
                                                            .type ==
                                                        AppConstant.folder) {
                                                      Navigator.of(context)
                                                          .pop();
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                              SnackBar(
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
                                                                        color: HexColor.fromHex(
                                                                            AppColor.primaryTextColor)),
                                                                  )));
                                                    } else {
                                                      Navigator.of(context)
                                                          .pop();
                                                      Navigator.of(context).push(
                                                          CustomRoutesPage(
                                                              widget:
                                                                  Sysnfusion(
                                                        fileId: widget
                                                            .folderList
                                                            .result![index]
                                                            .id!,
                                                      )));
                                                    }
                                                  },
                                                  icon: Icons.preview_outlined,
                                                  content: 'Preview',
                                                ))
                                              : (Container()),
                                          owner || viewer || editor
                                              ? (ListTitleModal(
                                                  onPress: () {
                                                    if (widget
                                                            .folderList
                                                            .result![index]
                                                            .type ==
                                                        AppConstant.folder) {
                                                      Navigator.of(context)
                                                          .pop();
                                                      Navigator.of(context).push(
                                                          CustomRoutesPage(
                                                              widget:
                                                                  FolderViewDetail(
                                                        folderId: widget
                                                            .folderList
                                                            .result![index]
                                                            .id
                                                            .toString(),
                                                      )));
                                                    } else {
                                                      Navigator.of(context)
                                                          .pop();
                                                      Navigator.of(context).push(
                                                          CustomRoutesPage(
                                                              widget:
                                                                  FileDetail(
                                                        fileId: widget
                                                            .folderList
                                                            .result![index]
                                                            .id
                                                            .toString(),
                                                      )));
                                                    }
                                                  },
                                                  icon: Icons.info_outlined,
                                                  content: 'View Details',
                                                ))
                                              : (Container()),
                                          // owner
                                          //     ? (ListTitleModal(
                                          //         onPress: () {},
                                          //         icon: Icons.update_outlined,
                                          //         content: 'Update Version',
                                          //       ))
                                          //     : (Container()),
                                          Divider(
                                            height: 4,
                                            color: HexColor.fromHex(
                                                AppColor.grayTextColor),
                                          ),
                                          owner || viewer || editor
                                              ? (ListTitleModal(
                                                  onPress: () {
                                                    if (widget
                                                            .folderList
                                                            .result![index]
                                                            .type! ==
                                                        AppConstant.folder) {
                                                      Navigator.of(context)
                                                          .pop();
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                              const SnackBar(
                                                                  content: Text(
                                                                      'Can not download folder ')));
                                                    } else {
                                                      Navigator.of(context)
                                                          .pop();
                                                      showDialog(
                                                          context: context,
                                                          builder: ((contextj) {
                                                            return DialogModalSheet(
                                                                title:
                                                                    'Dowlown File ${widget.folderList.result![index].name!}',
                                                                content:
                                                                    'Do you want to dowload file?',
                                                                onPressed: () {
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                  context.read<FileBloc>().add(DowloadFileEvent(
                                                                      fileId: widget
                                                                          .folderList
                                                                          .result![
                                                                              index]
                                                                          .id!));
                                                                },
                                                                nameBtn:
                                                                    'Download');
                                                          }));
                                                    }
                                                  },
                                                  icon: Icons.download_outlined,
                                                  content: 'Download',
                                                ))
                                              : (Container()),
                                          owner
                                              ? (ListTitleModal(
                                                  onPress: () {
                                                    Navigator.of(context).pop();
                                                    Navigator.of(context).push(
                                                        CustomRoutesPage(
                                                            widget:
                                                                const CopytoScreen()));
                                                  },
                                                  icon:
                                                      Icons.file_copy_outlined,
                                                  content: 'Copy To',
                                                ))
                                              : Container(),
                                          owner || editor
                                              ? (ListTitleModal(
                                                  onPress: () {
                                                    if (widget
                                                            .folderList
                                                            .result![index]
                                                            .type! ==
                                                        AppConstant.folder) {
                                                      Navigator.of(context)
                                                          .pop();
                                                      showDialog(
                                                          context: context,
                                                          builder: ((context) {
                                                            return DialogModalRenameSheet(
                                                              nameBtn:
                                                                  'Rename Folder',
                                                              title:
                                                                  'Rename folder ${widget.folderList.result![index].name}',
                                                              onPressed: () {
                                                                Navigator.of(
                                                                        context)
                                                                    .pop();
                                                                context.read<FolderBloc>().add(FolderRenameEvent(
                                                                    widget
                                                                        .folderList
                                                                        .result![
                                                                            index]
                                                                        .id!,
                                                                    controllerFolder
                                                                        .text));
                                                              },
                                                              controller:
                                                                  controllerFolder,
                                                            );
                                                          }));
                                                    } else {
                                                      Navigator.of(context)
                                                          .pop();
                                                      showDialog(
                                                          context: context,
                                                          builder: ((contexts) {
                                                            return DialogModalRenameSheet(
                                                              nameBtn:
                                                                  'Rename File',
                                                              title:
                                                                  'Rename file ${widget.folderList.result![index].name}',
                                                              onPressed: () {
                                                                Navigator.of(
                                                                        context)
                                                                    .pop();
                                                                FileRename fileRename = FileRename(
                                                                    description:
                                                                        '',
                                                                    name: controllerFile
                                                                        .text,
                                                                    tagsId: listIdTags
                                                                            .isNotEmpty
                                                                        ? listIdTags
                                                                        : []);

                                                                context.read<FileBloc>().add(RenameFileEvent(
                                                                    fileId: widget
                                                                        .folderList
                                                                        .result![
                                                                            index]
                                                                        .id!,
                                                                    fileRename:
                                                                        fileRename));
                                                              },
                                                              controller:
                                                                  controllerFile,
                                                            );
                                                          }));
                                                    }
                                                  },
                                                  icon: Icons
                                                      .drive_file_rename_outline,
                                                  content: 'Rename',
                                                ))
                                              : (Container()),
                                          owner
                                              ? (ListTitleModal(
                                                  onPress: () {
                                                    Navigator.of(context).pop();
                                                    Navigator.of(context).push(
                                                        CustomRoutesPage(
                                                            widget:
                                                                const MovetoScreen()));
                                                  },
                                                  icon: Icons.move_up_outlined,
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
                                                  onPress: () {
                                                    Navigator.of(context).pop();
                                                    if (widget
                                                            .folderList
                                                            .result![index]
                                                            .type ==
                                                        AppConstant.folder) {
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                              const SnackBar(
                                                                  content: Text(
                                                                      'Cant not back up folder')));
                                                    } else {
                                                      showDialog(
                                                          context: context,
                                                          builder: ((contextj) {
                                                            return DialogModalSheet(
                                                                title:
                                                                    'Backup File ${widget.folderList.result![index].name!}',
                                                                content:
                                                                    'Do you wan to back up file?',
                                                                onPressed: () {
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();

                                                                  context.read<FileBloc>().add(BackupFileEvent(
                                                                      fileId: widget
                                                                          .folderList
                                                                          .result![
                                                                              index]
                                                                          .id!));
                                                                  context
                                                                      .read<
                                                                          FolderBloc>()
                                                                      .add(
                                                                          LoadFolderPrivateEvent());
                                                                },
                                                                nameBtn:
                                                                    'Back up');
                                                          }));
                                                    }
                                                  },
                                                  icon: Icons.backup_outlined,
                                                  content: 'Back up',
                                                ))
                                              : Container(),
                                          owner
                                              ? (ListTitleModal(
                                                  onPress: () {
                                                    Navigator.of(context).pop();
                                                    Navigator.of(context).push(
                                                        CustomRoutesPage(
                                                            widget:
                                                                const SharedScreen()));
                                                  },
                                                  icon: Icons.share,
                                                  content: 'Share',
                                                ))
                                              : Container(),
                                          owner
                                              ? (ListTitleModal(
                                                  onPress: () {
                                                    if (widget
                                                            .folderList
                                                            .result![index]
                                                            .type ==
                                                        AppConstant.folder) {
                                                      Navigator.of(context)
                                                          .pop();
                                                      showDialog(
                                                          context: context,
                                                          builder: ((contextj) {
                                                            return DialogModalSheet(
                                                                title:
                                                                    'Folder ${widget.folderList.result![index].name!}',
                                                                content:
                                                                    'Do you wan to ${widget.folderList.result![index].isLocked! == true ? 'unLock' : 'lock'} folder?',
                                                                onPressed: () {
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                  context.read<FolderBloc>().add(LockFolderEvent(
                                                                      isLock: widget.folderList.result![index].isLocked! ==
                                                                              false
                                                                          ? true
                                                                          : false,
                                                                      folderId: widget
                                                                          .folderList
                                                                          .result![
                                                                              index]
                                                                          .id!));
                                                                },
                                                                nameBtn: widget
                                                                            .folderList
                                                                            .result![index]
                                                                            .isLocked! ==
                                                                        true
                                                                    ? 'UnLock'
                                                                    : 'Lock');
                                                          }));
                                                    } else {
                                                      Navigator.of(context)
                                                          .pop();
                                                      showDialog(
                                                          context: context,
                                                          builder: ((contextj) {
                                                            return DialogModalSheet(
                                                                title:
                                                                    'File ${widget.folderList.result![index].name!}',
                                                                content:
                                                                    'Do you wan to ${widget.folderList.result![index].isLocked! == true ? 'unLock' : 'lock'} file?',
                                                                onPressed: () {
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                  context.read<FileBloc>().add(LockFileEvent(
                                                                      isLock: widget.folderList.result![index].isLocked! ==
                                                                              false
                                                                          ? true
                                                                          : false,
                                                                      fileId: widget
                                                                          .folderList
                                                                          .result![
                                                                              index]
                                                                          .id!));
                                                                },
                                                                nameBtn: widget
                                                                            .folderList
                                                                            .result![index]
                                                                            .isLocked! ==
                                                                        true
                                                                    ? 'UnLock'
                                                                    : 'Lock');
                                                          }));
                                                    }
                                                  },
                                                  icon: widget
                                                              .folderList
                                                              .result![index]
                                                              .isLocked! ==
                                                          false
                                                      ? Icons.lock_open_outlined
                                                      : Icons.lock_outlined,
                                                  content: widget
                                                              .folderList
                                                              .result![index]
                                                              .isLocked! ==
                                                          false
                                                      ? 'UnLock'
                                                      : 'Lock',
                                                ))
                                              : (Container()),
                                          owner
                                              ? (ListTitleModal(
                                                  onPress: () {
                                                    if (widget
                                                            .folderList
                                                            .result![index]
                                                            .type ==
                                                        AppConstant.folder) {
                                                      Navigator.of(context)
                                                          .pop();
                                                      showDialog(
                                                          context: context,
                                                          builder: ((contextj) {
                                                            return DialogModalSheet(
                                                                title:
                                                                    'Delete Folder',
                                                                content:
                                                                    'Do you wan to delete ${widget.folderList.result![index].name} folder',
                                                                onPressed: () {
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();

                                                                  context.read<FolderBloc>().add(ArchiveFolderEvent(
                                                                      fileId: widget
                                                                          .folderList
                                                                          .result![
                                                                              index]
                                                                          .id!));
                                                                },
                                                                nameBtn:
                                                                    'Delete');
                                                          }));
                                                    } else {
                                                      Navigator.of(context)
                                                          .pop();
                                                      showDialog(
                                                          context: context,
                                                          builder: ((contexts) {
                                                            return DialogModalSheet(
                                                                title:
                                                                    'Delete File',
                                                                content:
                                                                    'Do you wan to file ${widget.folderList.result![index].name} folder',
                                                                onPressed: () {
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                  // BlocProvider.of<
                                                                  //             FileBloc>(
                                                                  //         contexts,
                                                                  //         listen:
                                                                  //             false)
                                                                  //     .add(ArchiveFileEvent(
                                                                  //         fileId: folderList
                                                                  //             .result![index]
                                                                  //             .id!));
                                                                  context
                                                                      .read<
                                                                          FolderBloc>()
                                                                      .add(
                                                                          LoadFolderPrivateEvent());
                                                                  context.read<FileBloc>().add(ArchiveFileEvent(
                                                                      fileId: widget
                                                                          .folderList
                                                                          .result![
                                                                              index]
                                                                          .id!));
                                                                },
                                                                nameBtn:
                                                                    'Delete');
                                                          }));
                                                    }
                                                  },
                                                  icon: Icons.delete_outline,
                                                  content: 'Delete',
                                                ))
                                              : (Container()),
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
                      )),
                )),
              ),
            ],
          );
        }));
  }
}
