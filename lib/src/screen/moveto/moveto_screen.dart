import 'package:document_mobile/src/bussiness/folder/bloc/folder_bloc.dart';
import 'package:document_mobile/src/data/model/folder/folder_result_folder.dart';
import 'package:document_mobile/src/screen/moveto/grid_private_screen.dart';
import 'package:document_mobile/src/screen/moveto/grid_public_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/util/util.dart';

// ignore: must_be_immutable
class MovetoScreen extends StatefulWidget {
  const MovetoScreen({Key? key}) : super(key: key);

  @override
  State<MovetoScreen> createState() => _MovetoScreenState();
}

class _MovetoScreenState extends State<MovetoScreen> {
  late List<ResultItemFolder> selectListItemPublic;
  late List<ResultItemFolder> selectListItemPrivate;

  @override
  void initState() {
    selectListItemPublic = [];
    selectListItemPrivate = [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextStyle tabStyle =
        TextStyle(color: HexColor.fromHex(AppColor.whiteTextColor));

    return BlocProvider(
      create: (context) => FolderBloc(RepositoryProvider.of(context)),
      child: DefaultTabController(
          length: 1,
          child: Scaffold(
              appBar: AppBar(
                title: Text(
                  selectListItemPublic.isEmpty
                      ? 'Move To'
                      : '${selectListItemPublic.length} folder selected',
                  style: h4StyleLight,
                ),
                actions: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.move_up_outlined))
                ],
                toolbarHeight: 29,
                bottom: TabBar(
                  indicatorColor:
                      HexColor.fromHex(AppColor.primaryDarkBtnColor),
                  unselectedLabelStyle: TextStyle(
                      color: HexColor.fromHex(AppColor.grayTextColor)),
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
                  selectedList: selectListItemPublic,
                ),
                GridPrivateFolder(
                  selectedList: selectListItemPrivate,
                )
              ]))),
    );
  }
}
