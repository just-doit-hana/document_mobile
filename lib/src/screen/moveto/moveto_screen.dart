import 'package:document_mobile/src/screen/moveto/grid_private_screen.dart';
import 'package:document_mobile/src/screen/moveto/grid_public_screen.dart';
import 'package:flutter/material.dart';

import '../../../app/util/util.dart';

class MovetoScreen extends StatefulWidget {
  const MovetoScreen({Key? key}) : super(key: key);

  @override
  State<MovetoScreen> createState() => _MovetoScreenState();
}

class _MovetoScreenState extends State<MovetoScreen> {
  @override
  Widget build(BuildContext context) {
    TextStyle tabStyle =
        TextStyle(color: HexColor.fromHex(AppColor.whiteTextColor));
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              title: Text(
                'Move To',
                style: h4StyleLight,
              ),
              toolbarHeight: 29,
              bottom: TabBar(
                indicatorColor: HexColor.fromHex(AppColor.primaryDarkBtnColor),
                unselectedLabelStyle:
                    TextStyle(color: HexColor.fromHex(AppColor.grayTextColor)),
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
                  ),
                ],
              ),
            ),
            body: const TabBarView(
                children: [GridPublicFolder(), GridPrivateFolder()])));
  }
}
