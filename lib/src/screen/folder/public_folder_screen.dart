import 'package:document_appmobile/app/util/util.dart';
import 'package:document_appmobile/app/widget/folder_list.dart';
import 'package:flutter/material.dart';

import '../../../app/widget/widget.dart';

class PublicFolder extends StatefulWidget {
  const PublicFolder({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _PublicFolderState createState() => _PublicFolderState();
}

class _PublicFolderState extends State<PublicFolder> {
  bool isType = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Flexible(
          flex: 1,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              children: <Widget>[
                Container(
                    padding: const EdgeInsets.only(top: 10),
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextSeachButton(
                            onPressed: (() {
                              ShowModalSearchName(context);
                            }),
                            title: 'Name',
                            iconData: Icons.arrow_upward_outlined),
                        const TextSeachButton(
                            title: 'Label',
                            iconData: Icons.arrow_upward_outlined),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                isType = !isType;
                              });
                            },
                            icon: isType
                                ? const Icon(Icons.grid_view_outlined)
                                : const Icon(Icons.list_outlined)),
                      ],
                    )),
                isType
                    ? (GridView.count(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: 2,
                        primary: false,
                        children: List.generate(100, (index) {
                          return Card(
                            shadowColor: Colors.transparent,
                            // color: Colors.blueGrey,
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.3,
                              child: Padding(
                                padding: const EdgeInsets.all(0.0),
                                child: Column(
                                  children: [
                                    Icon(
                                      Icons.folder_open_sharp,
                                      size: 100,
                                      color: HexColor.fromHex(
                                          AppColor.primaryDarkBtnColor),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: SizedBox(
                                        height: 80,
                                        child: ListView(
                                          scrollDirection: Axis.horizontal,
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 4),
                                              child: Chip(
                                                // labelPadding:
                                                //     EdgeInsets.fromLTRB(
                                                //         6, -2, 0, -1),
                                                padding:
                                                    EdgeInsets.only(right: 4),
                                                backgroundColor:
                                                    HexColor.fromHex(AppColor
                                                        .primaryBtnColor),
                                                shape: const RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    2),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    2),
                                                            topLeft:
                                                                Radius.circular(
                                                                    2),
                                                            topRight:
                                                                Radius.circular(
                                                                    2))),
                                                label: Text(
                                                  'Loan',
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontFamily: AppConstant
                                                          .poppinsFont,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: HexColor.fromHex(
                                                          AppColor
                                                              .lightBackgroundColor)),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(right: 4),
                                              child: Chip(
                                                backgroundColor:
                                                    HexColor.fromHex(AppColor
                                                        .primaryBtnColor),
                                                shape: const RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    2),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    2),
                                                            topLeft:
                                                                Radius.circular(
                                                                    2),
                                                            topRight:
                                                                Radius.circular(
                                                                    2))),
                                                label: Text(
                                                  'Document',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontFamily: AppConstant
                                                          .poppinsFont,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: HexColor.fromHex(
                                                          AppColor
                                                              .lightBackgroundColor)),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(right: 4),
                                              child: Chip(
                                                backgroundColor:
                                                    HexColor.fromHex(AppColor
                                                        .primaryBtnColor),
                                                shape: const RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    2),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    2),
                                                            topLeft:
                                                                Radius.circular(
                                                                    2),
                                                            topRight:
                                                                Radius.circular(
                                                                    2))),
                                                label: Text(
                                                  'Aaron Burr',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontFamily: AppConstant
                                                          .poppinsFont,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: HexColor.fromHex(
                                                          AppColor
                                                              .lightBackgroundColor)),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            'Document management Document management Document management ',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            softWrap: false,
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: HexColor.fromHex(
                                                  AppColor.blackTextColor),
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                        ElevatedButton(
                                            onPressed: () {
                                              ShowModalSearchName(context);
                                            },
                                            style: ElevatedButton.styleFrom(
                                              elevation: 0.0,
                                              backgroundColor:
                                                  Colors.red.withOpacity(0),
                                              shape:
                                                  const RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(2),
                                                      ),
                                                      side: BorderSide(
                                                          color: Colors
                                                              .transparent)),
                                            ),
                                            child: const Icon(
                                              Icons.more_vert_outlined,
                                              color: Colors.black45,
                                            )),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                      ))
                    // }),
                    // ))
                    : (const FolderList()),
              ],
            ),
          ),
        ),
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
