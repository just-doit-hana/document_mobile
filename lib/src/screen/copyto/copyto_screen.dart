import 'package:document_mobile/app/util/app_color.dart';
import 'package:document_mobile/app/util/app_extension.dart';
import 'package:document_mobile/app/util/app_style.dart';
import 'package:document_mobile/src/screen/moveto/grid_private_screen.dart';
import 'package:flutter/material.dart';

import '../../data/model/folder/folder_result_folder.dart';
import '../moveto/grid_public_screen.dart';

class CopytoScreen extends StatefulWidget {
  const CopytoScreen({Key? key}) : super(key: key);

  @override
  State<CopytoScreen> createState() => _CopytoScreenState();
}

class _CopytoScreenState extends State<CopytoScreen> {
  late List<ResultItemFolder> selectListItemPublic;

  late List<ResultItemFolder> selectListItemPrivate;
  @override
  void initState() {
    selectListItemPrivate = [];

    selectListItemPublic = [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextStyle tabStyle =
        TextStyle(color: HexColor.fromHex(AppColor.whiteTextColor));
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Copy To',
              style: h4StyleLight,
            ),
            bottom: TabBar(
                unselectedLabelStyle:
                    TextStyle(color: HexColor.fromHex(AppColor.grayTextColor)),
                indicatorColor: HexColor.fromHex(AppColor.primaryDarkBtnColor),
                tabs: <Widget>[
                  Tab(
                    child: Text(
                      'Public',
                      style: tabStyle,
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Private',
                      style: tabStyle,
                    ),
                  )
                ]),
          ),
          body: TabBarView(children: [
            GridPublicFolder(
              selectedList: selectListItemPublic,
            ),
            GridPrivateFolder(
              selectedList: selectListItemPrivate,
            )
          ])),
    );
  }
}
