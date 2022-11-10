import 'package:document_appmobile/app/animation/routes_animation.dart';
import 'package:document_appmobile/app/util/util.dart';
import 'package:document_appmobile/src/data/model/folder/folder.dart';
import 'package:document_appmobile/src/screen/folder/folder_detail.dart';
import 'package:flutter/material.dart';


import '../../../app/widget/widget.dart';


// ignore: must_be_immutable
class FolderList extends StatelessWidget {
 const FolderList({
    Key? key, required this.folderList,
  }) : super(key: key);
  final Result folderList;
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
    return
           ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: folderList.subFolders.length,
                  itemBuilder: ((context, index) {
                    return Column(
                      children: [
                        GestureDetector(
                          onDoubleTap: () {
                            Navigator.of(context).push(CustomRoutesPage(
                                widget: FolderDetail(
                              id: index,
                              subFolders: folderList,
                            )));
                          },
                          child: Card(
                              child: ListTile(
                                  title:
                                      Text(folderList.subFolders[index].name),
                                  // subtitle: Text(formatDateTime(
                                  //     '2022-10-27T09:17:46.453697',
                                  //     hastime: false)),
                                  leading: imgIcon(AppImage.iconFolder),
                                  trailing: ElevatedButton(
                                      onPressed: () {
                                        ShowModalSearchName(context);
                                      },
                                      style: ElevatedButton.styleFrom(
                                        elevation: 0.0,
                                        backgroundColor:
                                            Colors.red.withOpacity(0),
                                        shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(2),
                                            ),
                                            side: BorderSide(
                                                color: Colors.white)),
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
                      title: 'Last Modified',
                      icon: Icons.arrow_upward_outlined),
                  const AppBtnSearchModal(
                      title: 'Label', icon: Icons.arrow_upward_outlined),
                  const AppBtnSearchModal(
                      title: 'Member', icon: Icons.arrow_upward_outlined),
                ],
              ));
        });
  }

