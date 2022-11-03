import 'package:document_appmobile/app/util/dio/dio_client.dart';
import 'package:document_appmobile/app/util/util.dart';
import 'package:document_appmobile/src/screen/files/myfile_screen.dart';
import 'package:document_appmobile/src/screen/recylebin/recyclebin_screen.dart';
import 'package:document_appmobile/src/screen/shared/shared_screen.dart';
import 'package:flutter/material.dart';

import 'src/screen/home/home_folder.dart';

class App extends StatefulWidget {
  const App({
    Key? key,
    required this.dioClient,
  }) : super(key: key);
  final DioClient dioClient;

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int selectedItem = 0;

  void onSelectedItem(int value) {
    setState(() {
      selectedItem = value;
    });
  }

  static const List<Widget> _screen = <Widget>[
    HomeFolder(),
    MyfileScreen(),
    SharedScreen(),
    RecyclebinScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screen.elementAt(selectedItem),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 18,
          selectedItemColor: HexColor.fromHex(AppColor.primaryDarkBtnColor),
          currentIndex: selectedItem,
          onTap: onSelectedItem,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.folder_outlined),
              label: 'My files',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.share_outlined),
              label: 'Shared',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.delete_outlined),
              label: 'Recycle Bin',
            ),
          ]),
    );
  }
}
