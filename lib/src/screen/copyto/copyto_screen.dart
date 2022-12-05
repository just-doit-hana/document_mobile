import 'package:document_mobile/app/util/app_color.dart';
import 'package:document_mobile/app/util/app_extension.dart';
import 'package:document_mobile/app/util/app_style.dart';
import 'package:document_mobile/src/screen/moveto/grid_private_screen.dart';
import 'package:flutter/material.dart';

import '../moveto/grid_public_screen.dart';

class CopytoScreen extends StatelessWidget {
  const CopytoScreen({Key? key}) : super(key: key);

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
              selectedList: [],
            ),
            const GridPrivateFolder()
          ])),
    );
  }
}
