import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../src/bussiness/file/bloc/file_bloc.dart';
import '../../src/bussiness/folder/bloc/folder_bloc.dart';
import '../../src/data/model/file/file_rename.dart';
import '../../src/data/model/folder/folder_result_folder.dart';
import '../../src/screen/copyto/copyto_screen.dart';
import '../../src/screen/files/file_detail.dart';
import '../../src/screen/folder/folder_detail_sceen.dart';
import '../../src/screen/folder/foolder_sub_detail_grid_screen.dart';
import '../../src/screen/moveto/moveto_screen.dart';
import '../../src/screen/previewer/sysnfusion.dart';
import '../../src/screen/shared/shared_screen.dart';
import '../animation/routes_animation.dart';
import '../util/util.dart';
import 'app_dialogs.dart';
import 'icon_type.dart';
import 'list_title.dart';

// ignore: must_be_immutable
class FolderGrid extends StatefulWidget {
  FolderGrid({Key? key, required this.folderGrid, this.isSelected})
      : super(key: key);
  final List<ResultItemFolder> folderGrid;
  ValueChanged<bool>? isSelected;
  @override
  State<FolderGrid> createState() => _FolderGridState();
}

class _FolderGridState extends State<FolderGrid> {
  int? count;
  bool isSelected = false;
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
      children: List.generate(widget.folderGrid.length, (index) {
        var owner = (widget.folderGrid[index].accessScope == AppConstant.owner);
        var viewer =
            (widget.folderGrid[index].accessScope == AppConstant.viewer);
        var editor =
            (widget.folderGrid[index].accessScope == AppConstant.editor);
        var type = widget.folderGrid[index].type == AppConstant.folder;
        var isLock = widget.folderGrid[index].isLocked;
        var listIdTags = [];
        widget.folderGrid[index].tags!.forEach(((element) {
          listIdTags.add(element.id);
        }));
        return GestureDetector(
          onLongPress: (() {
            setState(() {
              isSelected = !isSelected;
              widget.isSelected!(isSelected);
            });
          }),
          onDoubleTap: (() {
            if (widget.folderGrid[index].type == AppConstant.folder) {
              Navigator.of(context).push(CustomRoutesPage(
                  widget: FolderSubFolderDetailGrid(
                      folderList: widget.folderGrid,
                      idIndex: index,
                      folderId: widget.folderGrid[index].id!)));
            } else {
              return;
            }
          }),
          child: Stack(
            children: <Widget>[
              Card(
                // color: Colors.transparent
                color: const Color.fromARGB(255, 175, 225, 249)
                    .withOpacity(isSelected ? 0.9 : 0),
                shadowColor: Colors.black.withOpacity(isSelected ? 0.9 : 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        child: iconType(
                            widget.folderGrid[index].type.toString(),
                            height: 70.0,
                            width: 70.0)),
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
                                widget.folderGrid[index].name.toString(),
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                softWrap: false,
                                style: TextStyle(
                                  fontSize: 14,
                                  color:
                                      HexColor.fromHex(AppColor.blackTextColor),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                          ElevatedButton(
                              onPressed: () {
                                showModalBottomSheet(
                                    isDismissible: true,
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    context: context,
                                    builder: (ctx) {
                                      return Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.8,
                                          decoration: BoxDecoration(
                                              color: HexColor.fromHex(AppColor
                                                  .lightBackgroundColor), // or some other color
                                              borderRadius:
                                                  const BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(25.0),
                                                      topRight: Radius.circular(
                                                          25.0))),
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
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                          child: widget
                                                                      .folderGrid[
                                                                          index]
                                                                      .type ==
                                                                  AppConstant
                                                                      .folder
                                                              ? imgIcon(AppImage
                                                                  .iconFolder)
                                                              : iconType(widget
                                                                  .folderGrid[
                                                                      index]
                                                                  .type
                                                                  .toString()),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 11),
                                                          child: Text(
                                                            widget
                                                                .folderGrid[
                                                                    index]
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
                                                                    FontWeight
                                                                        .w400,
                                                                color: HexColor
                                                                    .fromHex(
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
                                                                    .folderGrid[
                                                                        index]
                                                                    .type ==
                                                                AppConstant
                                                                    .folder) {
                                                              ScaffoldMessenger
                                                                      .of(
                                                                          context)
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
                                                                fileId: widget
                                                                    .folderGrid[
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
                                                            if (widget
                                                                    .folderGrid[
                                                                        index]
                                                                    .type ==
                                                                AppConstant
                                                                    .folder) {
                                                              Navigator.of(context).push(
                                                                  CustomRoutesPage(
                                                                      widget:
                                                                          FolderViewDetail(
                                                                folderId: widget
                                                                    .folderGrid[
                                                                        index]
                                                                    .id
                                                                    .toString(),
                                                              )));
                                                            } else {
                                                              Navigator.of(context).push(
                                                                  CustomRoutesPage(
                                                                      widget:
                                                                          FileDetail(
                                                                fileId: widget
                                                                    .folderGrid[
                                                                        index]
                                                                    .id
                                                                    .toString(),
                                                              )));
                                                            }
                                                          },
                                                          icon: Icons
                                                              .info_outlined,
                                                          content:
                                                              'View Details',
                                                        ))
                                                      : (Container()),
                                                  // owner
                                                  //     ? (ListTitleModal(
                                                  //         onPress: () {},
                                                  //         icon:
                                                  //             Icons.update_outlined,
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
                                                          onPress: () {},
                                                          icon: Icons
                                                              .download_outlined,
                                                          content: 'Download',
                                                        ))
                                                      : (Container()),
                                                  owner
                                                      ? (ListTitleModal(
                                                          onPress: () {
                                                            Navigator.of(
                                                                    context)
                                                                .push(CustomRoutesPage(
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
                                                            if (type) {
                                                              showDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      ((context) {
                                                                    return DialogModalRenameSheet(
                                                                      nameBtn:
                                                                          'Rename Folder',
                                                                      title:
                                                                          'Rename folder ${widget.folderGrid[index].name}',
                                                                      onPressed:
                                                                          () {
                                                                        Navigator.of(context)
                                                                            .pop();
                                                                        context.read<FolderBloc>().add(FolderRenameEvent(
                                                                            widget.folderGrid[index].id!,
                                                                            controllerFolder.text));
                                                                      },
                                                                      controller:
                                                                          controllerFolder,
                                                                    );
                                                                  }));
                                                            } else {
                                                              showDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      ((contexts) {
                                                                    return DialogModalRenameSheet(
                                                                      nameBtn:
                                                                          'Rename File',
                                                                      title:
                                                                          'Rename file ${widget.folderGrid[index].name}',
                                                                      onPressed:
                                                                          () {
                                                                        Navigator.of(context)
                                                                            .pop();
                                                                        FileRename fileRename = FileRename(
                                                                            description:
                                                                                '',
                                                                            name: controllerFile
                                                                                .text,
                                                                            tagsId: listIdTags.isNotEmpty
                                                                                ? listIdTags
                                                                                : []);

                                                                        context.read<FileBloc>().add(RenameFileEvent(
                                                                            fileId:
                                                                                widget.folderGrid[index].id!,
                                                                            fileRename: fileRename));
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
                                                            Navigator.of(
                                                                    context)
                                                                .push(CustomRoutesPage(
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
                                                          onPress: () {
                                                            if (type) {
                                                              ScaffoldMessenger
                                                                      .of(
                                                                          context)
                                                                  .showSnackBar(
                                                                      const SnackBar(
                                                                          content:
                                                                              Text('Cant not back up folder')));
                                                            } else {
                                                              showDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      ((contextj) {
                                                                    return DialogModalSheet(
                                                                        title:
                                                                            'Backup File ${widget.folderGrid[index].name!}',
                                                                        content:
                                                                            'Do you wan to back up file?',
                                                                        onPressed:
                                                                            () {
                                                                          Navigator.of(context)
                                                                              .pop();
                                                                          context
                                                                              .read<FileBloc>()
                                                                              .add(BackupFileEvent(fileId: widget.folderGrid[index].id!));
                                                                        },
                                                                        nameBtn:
                                                                            'Back up');
                                                                  }));
                                                            }
                                                          },
                                                          icon: Icons
                                                              .backup_outlined,
                                                          content: 'Back up',
                                                        ))
                                                      : Container(),
                                                  owner
                                                      ? (ListTitleModal(
                                                          onPress: () {
                                                            Navigator.of(
                                                                    context)
                                                                .push(CustomRoutesPage(
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
                                                            if (type) {
                                                              showDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      ((contextj) {
                                                                    return DialogModalSheet(
                                                                        title:
                                                                            'Folder ${widget.folderGrid[index].name!}',
                                                                        content:
                                                                            'Do you wan to ${isLock == true ? 'unLock' : 'lock'} folder?',
                                                                        onPressed:
                                                                            () {
                                                                          Navigator.of(context)
                                                                              .pop();
                                                                          context.read<FolderBloc>().add(LockFolderEvent(
                                                                              isLock: isLock == false ? true : false,
                                                                              folderId: widget.folderGrid[index].id!));
                                                                        },
                                                                        nameBtn: isLock ==
                                                                                true
                                                                            ? 'UnLock'
                                                                            : 'Lock');
                                                                  }));
                                                            } else {
                                                              showDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      ((contextj) {
                                                                    return DialogModalSheet(
                                                                        title:
                                                                            'File ${widget.folderGrid[index].name!}',
                                                                        content:
                                                                            'Do you wan to ${isLock == true ? 'unLock' : 'lock'} file?',
                                                                        onPressed:
                                                                            () {
                                                                          Navigator.of(context)
                                                                              .pop();
                                                                          context.read<FileBloc>().add(LockFileEvent(
                                                                              isLock: isLock == false ? true : false,
                                                                              fileId: widget.folderGrid[index].id!));
                                                                        },
                                                                        nameBtn: isLock ==
                                                                                true
                                                                            ? 'UnLock'
                                                                            : 'Lock');
                                                                  }));
                                                            }
                                                          },
                                                          icon: isLock == false
                                                              ? Icons
                                                                  .lock_open_outlined
                                                              : Icons
                                                                  .lock_outlined,
                                                          content:
                                                              isLock == false
                                                                  ? 'UnLock'
                                                                  : 'Lock',
                                                        ))
                                                      : (Container()),
                                                  owner
                                                      ? (ListTitleModal(
                                                          onPress: () {
                                                            if (type) {
                                                              showDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      ((contextj) {
                                                                    return DialogModalSheet(
                                                                        title:
                                                                            'Delete Folder',
                                                                        content:
                                                                            'Do you wan to delete ${widget.folderGrid[index].name} folder',
                                                                        onPressed:
                                                                            () {
                                                                          Navigator.of(context)
                                                                              .pop();

                                                                          context
                                                                              .read<FolderBloc>()
                                                                              .add(ArchiveFolderEvent(fileId: widget.folderGrid[index].id!));
                                                                        },
                                                                        nameBtn:
                                                                            'Delete');
                                                                  }));
                                                            } else {
                                                              showDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      ((contexts) {
                                                                    return DialogModalSheet(
                                                                        title:
                                                                            'Delete File',
                                                                        content:
                                                                            'Do you wan to file ${widget.folderGrid[index].name} folder',
                                                                        onPressed:
                                                                            () {
                                                                          Navigator.of(context)
                                                                              .pop();

                                                                          context
                                                                              .read<FileBloc>()
                                                                              .add(ArchiveFileEvent(fileId: widget.folderGrid[index].id!));
                                                                        },
                                                                        nameBtn:
                                                                            'Delete');
                                                                  }));
                                                            }
                                                          },
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
                              },
                              style: ElevatedButton.styleFrom(
                                elevation: 0.0,
                                backgroundColor: Colors.red.withOpacity(0),
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(2),
                                    ),
                                    side:
                                        BorderSide(color: Colors.transparent)),
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
              isSelected
                  ? const Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(Icons.check_box_outlined),
                      ),
                    )
                  : Container(),
            ],
          ),
        );
      }),
    );
  }
}
