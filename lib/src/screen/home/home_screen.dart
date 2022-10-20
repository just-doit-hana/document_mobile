import 'dart:ui';

import 'package:document_appmobile/app/animation/routes_animation.dart';
import 'package:document_appmobile/app/util/dio/dio_client.dart';
import 'package:document_appmobile/app/util/util.dart';
import 'package:document_appmobile/app/widget/widget.dart';
import 'package:document_appmobile/src/screen/login/login_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
    required this.dioClient,
  }) : super(key: key);
  final DioClient dioClient;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    _appBar(height) => PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, height + 80),
          child: const Center(
            child: Text('test'),
          ),
          // child: Stack(
          //   children: <Widget>[
          //     Container(
          //       color: Theme.of(context).primaryColor,
          //       height: height + 75,
          //       width: MediaQuery.of(context).size.width,
          //       child: Center(
          //         child: Text(
          //           "Home",
          //           style: TextStyle(
          //               fontFamily: AppConstant.poppinsFont,
          //               fontSize: 20,
          //               color: Colors.white),
          //         ),
          //       ),
          //     ),

          //     Container(), // Required some widget in between to float AppBar

          //     Positioned(
          //       // To take AppBar Size only
          //       top: 100.0,
          //       left: 20.0,
          //       right: 20.0,
          //       child: AppBar(
          //         backgroundColor: Colors.white,
          //         leading: IconButton(
          //           color: Theme.of(context).primaryColor,
          //           icon: const Icon(Icons.menu),
          //           onPressed: () => _scaffoldKey.currentState!.openDrawer(),
          //         ),
          //         primary: false,
          //         title: const TextField(
          //             decoration: InputDecoration(
          //                 hintText: "Search",
          //                 border: InputBorder.none,
          //                 hintStyle: TextStyle(color: Colors.grey))),
          //         actions: <Widget>[
          //           IconButton(
          //             icon: Icon(Icons.search,
          //                 color: Theme.of(context).primaryColor),
          //             onPressed: () {},
          //           ),
          //           IconButton(
          //             icon: Icon(Icons.notifications,
          //                 color: Theme.of(context).primaryColor),
          //             onPressed: () {},
          //           )
          //         ],
          //       ),
          //     )
          //   ],
          // ),
        );
    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: HexColor.fromHex(AppColor.lightBackgroundColor),
        appBar: _appBar(AppBar().preferredSize.height),
        drawer: Container(
          margin: const EdgeInsets.only(top: 30),
          child: const DrawerAppbar(),
        ));
  }
}
