import 'package:document_appmobile/app/util/util.dart';
import 'package:document_appmobile/src/data/model/folder/folder.dart';
import 'package:flutter/material.dart';

import '../../../app/widget/widget.dart';
import '../util/dio/dio_client.dart';

class FolderList extends StatefulWidget {
  FolderList({Key? key, required this.test}) : super(key: key);
  DioClient test;
  @override
  // ignore: library_private_types_in_public_api
  _FolderListState createState() => _FolderListState();
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
    return Column(
      children: [
        FutureBuilder<FolderResponse?>(
          // future: widget.test.listPublicFolder(),
          builder: (context, snapshot) {
            return Card(
                child: ListTile(
                    title: const Text("DSC Management"),
                    subtitle: const Text("Oct 21 11:30"),
                    leading: imgIcon(AppImage.iconImg),
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
                        ))));
            // if (snapshot.connectionState == ConnectionState.waiting) {
            //   return const OutputPanel(showLoading: true);
            // } else if (snapshot.hasError) {
            //   return OutputError(errorMessage: snapshot.error.toString());
            // } else if (snapshot.hasData) {
            //   return OutputPanel(user: snapshot.data);
            // } else {
            //   return const OutputPanel();
            // }
          },
        ),
        Card(
            child: ListTile(
                title: const Text("DSC Management"),
                subtitle: const Text("Oct 21 11:30"),
                leading: imgIcon(AppImage.iconFolder),
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
        Card(
            child: ListTile(
                title: const Text("DSC Management jshdj bsjd bjsd jsd"),
                subtitle: const Text("Oct 21 11:30"),
                leading: imgIcon(AppImage.iconExcell),
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
        Card(
            child: ListTile(
                title: const Text("DSC Management"),
                subtitle: const Text("Oct 21 11:30"),
                leading: imgIcon(AppImage.iconPpt),
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
        Card(
            child: ListTile(
                title: const Text("DSC Management"),
                subtitle: const Text("Oct 21 11:30"),
                leading: imgIcon(AppImage.iconTxt),
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
        Card(
            child: ListTile(
                title: const Text("DSC Management"),
                subtitle: const Text("Oct 21 11:30"),
                leading: imgIcon(AppImage.iconImg),
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
        Card(
            child: ListTile(
                title: const Text("DSC Management"),
                subtitle: const Text("Oct 21 11:30"),
                leading: imgIcon(AppImage.iconZip),
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
        Card(
            child: ListTile(
                title: const Text("DSC Management"),
                subtitle: const Text("Oct 21 11:30"),
                leading: imgIcon(AppImage.iconVideo),
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
        Card(
            child: ListTile(
                title: const Text("DSC Management"),
                subtitle: const Text("Oct 21 11:30"),
                leading: imgIcon(AppImage.iconUnknow),
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
        Card(
            child: ListTile(
                title: const Text("DSC Management"),
                subtitle: const Text("Oct 21 11:30"),
                leading: imgIcon(AppImage.iconPdf),
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
        Card(
            child: ListTile(
                title: const Text("DSC Management"),
                subtitle: const Text("Oct 21 11:30"),
                leading: imgIcon(AppImage.iconWord),
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
                    ))))
      ],
    );
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
}
