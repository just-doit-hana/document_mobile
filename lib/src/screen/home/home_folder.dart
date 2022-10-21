import 'package:flutter/material.dart';

import '../../../app/util/util.dart';
import '../../../app/widget/widget.dart';
import 'custom_view_appbar.dart';

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
    // appBar(height) => PreferredSize(
    //     preferredSize: Size(MediaQuery.of(context).size.width, height + 30),
    //     child: AppBar(
    //         //  bottom:,
    //         flexibleSpace: Column(
    //           mainAxisAlignment: MainAxisAlignment.end,
    //           children: const [
    //             TabBar(padding: EdgeInsets.only(top: 40), tabs: [
    //               Tab(
    //                 text: 'Public Folder',
    //               ),
    //               Tab(
    //                 text: 'Private Folder',
    //               )
    //             ])
    //           ],
    //         ),
    //         leading: IconButton(
    //           icon: const Icon(Icons.menu_outlined),
    //           onPressed: () => _scaffoldKey.currentState!.openDrawer(),
    //         ),
    //         backgroundColor: HexColor.fromHex(AppColor.primaryBtnColor),
    //         // title: const Text('Home'),
    //         title: Container(
    //             color: HexColor.fromHex(AppColor.lightBackgroundColor),
    //             child: TextField(
    //               controller: searchController,
    //               textInputAction: TextInputAction.done,
    //               textAlign: TextAlign.left,
    //               keyboardType: TextInputType.text,
    //               decoration: const InputDecoration(
    //                   hintText: 'Search Folder Name',
    //                   border: InputBorder.none,
    //                   hintStyle: TextStyle(color: Colors.grey)),
    //             )),
    //         actions: const [
    //           CircleAvatar(
    //             radius: 20.0,
    //             backgroundImage: NetworkImage(
    //               'https://www.woolha.com/media/2020/03/eevee.png',
    //             ),
    //           )
    //         ]));
    // appBar(height) {
    //   return PreferredSize(
    //       preferredSize: Size(MediaQuery.of(context).size.width, height + 100),
    //       child: Stack(
    //         children: <Widget>[
    //           Container(
    //             color: HexColor.fromHex(AppColor.primaryBtnColor),
    //             height: height + 100,
    //             width: MediaQuery.of(context).size.width,
    //             child: const Center(
    //               child: Text(
    //                 'Home',
    //                 style: TextStyle(
    //                     fontWeight: FontWeight.w500,
    //                     fontFamily: AppConstant.poppinsFont,
    //                     fontSize: 20),
    //               ),
    //             ),
    //           ),
    //           // Container(), //Required some widget in between to float AppBar
    //           Positioned(
    //               top: 120,
    //               left: 20,
    //               right: 20,
    //               child: AppBar(
    //                 flexibleSpace: Container(
    //                   // height: 150,
    //                   child: Column(
    //                     mainAxisAlignment: MainAxisAlignment.end,
    //                     children: const [
    //                       TabBar(padding: EdgeInsets.only(top: 20), tabs: [
    //                         Tab(
    //                           text: 'Public Folder',
    //                         ),
    //                         Tab(
    //                           text: 'Private Folder',
    //                         )
    //                       ])
    //                     ],
    //                   ),
    //                 ),
    //                 shape: const ContinuousRectangleBorder(
    //                   borderRadius: BorderRadius.only(
    //                     topLeft: Radius.circular(12),
    //                     topRight: Radius.circular(12),
    //                     bottomLeft: Radius.circular(12),
    //                     bottomRight: Radius.circular(12),
    //                   ),
    //                 ),
    //                 // backgroundColor:
    //                 //     HexColor.fromHex(AppColor.lightBackgroundColor),
    //                 leading: IconButton(
    //                   icon: const Icon(Icons.menu_outlined),
    //                   color: HexColor.fromHex(AppColor.primaryDarkBtnColor),
    //                   onPressed: () => _scaffoldKey.currentState!.openDrawer(),
    //                 ),
    //                 primary: false,
    //                 title: const TextField(
    //                   // controller: searchController,
    //                   textInputAction: TextInputAction.done,
    //                   keyboardType: TextInputType.text,
    //                   decoration: InputDecoration(
    //                       hintText: 'Search Folder',
    //                       border: InputBorder.none,
    //                       hintStyle: TextStyle(color: Colors.grey)),
    //                 ),
    //                 actions: [
    //                   IconButton(
    //                       onPressed: () {},
    //                       icon: Icon(
    //                         Icons.search_outlined,
    //                         color: HexColor.fromHex(AppColor.primaryBtnColor),
    //                       ))
    //                 ],
    //               ))
    //         ],
    //       ));
    // }

    TextStyle tabStyle =
        TextStyle(color: HexColor.fromHex(AppColor.primaryTextColor));
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          key: _scaffoldKey,
          drawer: Container(
            margin: const EdgeInsets.only(top: 0),
            child: const DrawerAppbar(),
          ),
          body: CustomViewAppBar(scaffoldKey: _scaffoldKey, tabStyle: tabStyle),
        ));
  }
}
