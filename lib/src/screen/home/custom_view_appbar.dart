import 'package:flutter/material.dart';

import '../../../app/util/util.dart';
import '../folder/private_folder_screen.dart';
import '../folder/public_folder_screen.dart';

class CustomViewAppBar extends StatelessWidget {
  const CustomViewAppBar({
    Key? key,
    required GlobalKey<ScaffoldState> scaffoldKey,
    required this.tabStyle,
  })  : _scaffoldKey = scaffoldKey,
        super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey;
  final TextStyle tabStyle;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(30.0), // Add this code
            child: Text(''), // Add this code
          ),
          // expandedHeight: 90,
          backgroundColor: HexColor.fromHex(AppColor.primaryBtnColor),
          leading: IconButton(
            color: HexColor.fromHex(AppColor.lightBackgroundColor),
            icon: const Icon(Icons.menu_outlined),
            onPressed: () => _scaffoldKey.currentState!.openDrawer(),
          ),
          // title: TextField(
          //   onSubmitted: (value) => print(value),
          //   textInputAction: TextInputAction.done,
          //   keyboardType: TextInputType.text,
          //   decoration: const InputDecoration(
          //       hintText: 'Search Folder',
          //       border: InputBorder.none,
          //       hintStyle: TextStyle(color: Colors.grey)),
          // ),
          title: const Text(
            'Home',
            style: TextStyle(fontFamily: AppConstant.poppinsFont),
          ),
          actions: const [
            // CircleAvatar(
            //   radius: 20.0,
            //   backgroundImage: NetworkImage(
            //     'https://www.woolha.com/media/2020/03/eevee.png',
            //   ),
            // )
          ],
          floating: true,
          primary: true,
          pinned: false,
        ),
        SliverFillRemaining(
          child: Scaffold(
              appBar: TabBar(
                indicatorColor: HexColor.fromHex(AppColor.darkBackgroundColor),
                // unselectedLabelColor: Colors.red,
                unselectedLabelStyle:
                    TextStyle(color: HexColor.fromHex(AppColor.grayTextColor)),
                tabs: <Widget>[
                  Tab(
                    child: Text(
                      'Public Folder',
                      style: tabStyle,
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Private Folder',
                      style: tabStyle,
                    ),
                  ),
                ],
              ),
              body: const TabBarView(
                  children: [PublicFolder(), PrivateFolder()])),
        )
      ],
    );
  }
}
