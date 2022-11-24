import 'package:document_mobile/src/screen/shared/share_file_screen.dart';
import 'package:flutter/material.dart';

import 'app/util/util.dart';
import 'app/widget/menu_item_drawer.dart';
import 'src/screen/files/sysnfusion.dart';
import 'src/screen/home/home_folder.dart';
import 'src/screen/recylebin/recyclebin_screen.dart';

//
class App extends StatefulWidget {
  const App({
    Key? key,
  }) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int selectedItem = 0;
  GlobalKey<ScaffoldState>? _scaffoldKey;
  void onSelectedItem(int value) {
    setState(() {
      selectedItem = value;
    });
  }

  static const List<Widget> _screen = <Widget>[
    HomeFolder(),
    Sysnfusion(),
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
