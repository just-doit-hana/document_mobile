import 'package:flutter/material.dart';

import '../../../app/util/util.dart';
import '../folder/private_folder_screen.dart';
import '../folder/public_folder_screen.dart';

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
              title: const Text('Move To'),
              toolbarHeight: 29,
              bottom: TabBar(
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
            body: const TabBarView(children: [])));
  }
}
