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
  int? count;

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).orientation == Orientation.landscape) {
      count = 4;
    } else {
      count = 2;
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              children: <Widget>[
                Container(
                    color: Colors.transparent,
                    padding: const EdgeInsets.only(top: 10),
                    // width: double.infinity,
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
                        crossAxisCount: count!,
                        primary: false,
                        crossAxisSpacing: 2,
                        mainAxisSpacing: 3,
                        childAspectRatio: 1.2,
                        children: List.generate(20, (index) {
                          return Card(
                            // elevation: 20,
                            color: Colors.transparent,
                            shadowColor: Colors.transparent,
                            child: Container(
                              // width: MediaQuery.of(context).size.width,
                              // height: MediaQuery.of(context).size.width,
                              // child: Flexible(
                              //   flex: 2,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image.asset(
                                    '${AppImage.path}/${AppImage.iconWord}',
                                    fit: BoxFit.cover,
                                    height: 70,
                                    width: 70,
                                  ),
                                  Container(
                                    width: double.infinity,
                                    // color: Colors.red,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Expanded(
                                          flex: 2,
                                          child: Text(
                                            'It Department Vietjet',
                                            textAlign: TextAlign.center,
                                            maxLines: 2,
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
                                    ),
                                  )
                                ],
                              ),
                            ),
                            // ),
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
