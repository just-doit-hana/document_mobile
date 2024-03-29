import 'package:document_mobile/src/screen/search/search_screen.dart';
import 'package:flutter/material.dart';

import '../../../app/util/util.dart';
// import '../search/search_screen.dart';

class AppSliverAppBar extends StatelessWidget {
  const AppSliverAppBar({
    Key? key,
    GlobalKey<ScaffoldState>? scaffoldKey,
  })  : _scaffoldKey = scaffoldKey,
        super(key: key);

  final GlobalKey<ScaffoldState>? _scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(18.0),
          bottomRight: Radius.circular(18.0),
        ),
      ),
      bottom: const PreferredSize(
        preferredSize: Size.fromHeight(30.0), // Add this code
        child: Text(''), // Add this code
      ),
      leading: IconButton(
        color: HexColor.fromHex(AppColor.lightBackgroundColor),
        icon: const Icon(Icons.menu_outlined),
        onPressed: () => _scaffoldKey!.currentState!.openDrawer(),
      ),
      title: const Text(
        'Document Management',
        style: TextStyle(
            fontWeight: FontWeight.w500,
            fontFamily: AppConstant.poppinsFont,
            fontSize: 17),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.search_rounded),
          onPressed: () {
            showSearch(
                context: context, delegate: FolderSearch('Search Folder'));
          },
        ),
      ],
      floating: true,
      primary: true,
      pinned: false,
    );
  }
}
