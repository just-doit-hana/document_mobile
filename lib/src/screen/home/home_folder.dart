import 'package:flutter/material.dart';

import '../../../app/util/util.dart';
import '../../../app/widget/widget.dart';
import '../folder/private_folder_screen.dart';
import '../folder/public_folder_screen.dart';
import 'appbar_sliver.dart';

class HomeFolder extends StatefulWidget {
  const HomeFolder({Key? key}) : super(key: key);

  @override
  State<HomeFolder> createState() => _HomeFolderState();
}

class _HomeFolderState extends State<HomeFolder> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TextStyle tabStyle =
        TextStyle(color: HexColor.fromHex(AppColor.primaryTextColor));
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          key: _scaffoldKey,
          body: CustomScrollView(
            slivers: <Widget>[
              AppSliverAppBar(scaffoldKey: _scaffoldKey),
              SliverFillRemaining(
                hasScrollBody: false,
                child: Scaffold(
                    appBar: TabBar(
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
                    body: const TabBarView(children: [
                      PublicFolder(),
                      PrivateFolder(),
                    ])),
              ),
            ],
          ),
          drawer: Container(
            margin: const EdgeInsets.only(top: 0),
            child: const DrawerAppbar(),
          ),
        ));
  }
}
