import 'package:document_mobile/src/data/model/folder/folder_result_folder.dart';
import 'package:document_mobile/src/screen/moveto/grid_private_screen.dart';
import 'package:document_mobile/src/screen/moveto/grid_public_screen.dart';
import 'package:flutter/material.dart';

import '../../../app/util/util.dart';

// ignore: must_be_immutable
class MovetoScreen extends StatefulWidget {
  MovetoScreen({Key? key}) : super(key: key);

  @override
  State<MovetoScreen> createState() => _MovetoScreenState();
}

class _MovetoScreenState extends State<MovetoScreen> {
  late List<ResultItemFolder> selectListItem;
  @override
  void initState() {
    selectListItem = [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextStyle tabStyle =
        TextStyle(color: HexColor.fromHex(AppColor.whiteTextColor));

    return DefaultTabController(
        length: 1,
        child: Scaffold(
            appBar: AppBar(
              title: Text(
                selectListItem.isEmpty
                    ? 'Move To'
                    : '${selectListItem.length} folder selected',
                style: h4StyleLight,
              ),
              actions: [
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.move_up_outlined))
              ],
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
            body: TabBarView(children: [
              GridPublicFolder(
                selectedList: selectListItem,
              ),
              const GridPrivateFolder()
            ])));
  }
}
