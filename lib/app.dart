import 'package:document_mobile/src/screen/archive/archived_screen.dart';
import 'package:document_mobile/src/screen/files/myfile_screen.dart';
import 'package:document_mobile/src/screen/shared/share_file_screen.dart';
import 'package:flutter/material.dart';

import 'app/util/util.dart';
import 'src/screen/home/home_folder.dart';
import 'src/screen/recylebin/recyclebin_screen.dart';

// owner --? co tat cat quyen
// edit public    ->  Preview , viewdetail, Dowload, , rename
// edit   ->  Preview , viewdetail, Dowload, copy , rename
// viewer public --> view detail / preview / download
// viewer private --? preview / view detail

class App extends StatefulWidget {
  const App({
    Key? key,
  }) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int selectedItem = 0;
  // GlobalKey<ScaffoldState>? _scaffoldKey;
  void onSelectedItem(int value) {
    setState(() {
      selectedItem = value;
    });
  }

  static const List<Widget> _screen = <Widget>[
    HomeFolder(),
    // AchiveFileScreen(),
    ShareFileScreen(),
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
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.folder_outlined),
            //   label: 'Archived',
            // ),
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
