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
                            icon: const Icon(Icons.list_outlined)),
                        // IconButton(onPressed: () {}, icon: Icon(Icons.grid_on_outlined))
                      ],
                    )),
                isType
                    ? (MediaQuery.removePadding(
                        context: context,
                        removeTop: true,
                        child:
                            OrientationBuilder(builder: (context, orientation) {
                          return GridView.count(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            crossAxisCount: 2,
                            primary: false,
                            padding: const EdgeInsets.all(20),
                            children: List.generate(100, (index) {
                              return Center(
                                child: Text(
                                  'Item $index',
                                  style: Theme.of(context).textTheme.headline5,
                                ),
                              );
                            }),
                          );
                        }),
                      ))
                    : (const FolderList()),
              ],
            ),
          ),
        ),
      ],
    );
  }

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
