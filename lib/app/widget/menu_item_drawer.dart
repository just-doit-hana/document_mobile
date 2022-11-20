import 'package:flutter/material.dart';

import '../../src/screen/archive/archived_screen.dart';
import '../../src/screen/recylebin/recyclebin_screen.dart';
import '../animation/routes_animation.dart';
import '../util/util.dart';

class DrawerAppbar extends StatelessWidget {
  const DrawerAppbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.65,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: 120,
            child: DrawerHeader(
              decoration: BoxDecoration(
                  color: HexColor.fromHex(AppColor.primaryBtnColor)),
              child: const Text(
                'Document Management',
                textAlign: TextAlign.justify,
                // style: TextStyle(
                //     fontFamily: AppConstant.poppinsFont,
                //     fontSize: 17,
                //     fontWeight: FontWeight.w500),
              ),
            ),
          ),
          MenuItemDrawer(
              title: 'Share file',
              iconData: Icons.share_outlined,
              onPressed: (() {
                // final login =
                //     LoginUser(username: 'huytq', password: '123456');
                // try {
                //   final responseUser = widget.dioClient.login(login);
                //   print('Resonse user home $responseUser');
                //   // setState(() => createdUser = responseUser);
                // } catch (err) {
                //   print('Print Err ${err.toString()}');
                // }
              })),
          // only backup file
          MenuItemDrawer(
              title: 'Archive File',
              iconData: Icons.archive_outlined,
              onPressed: () {
                Navigator.of(context)
                    .push(CustomRoutesPage(widget: const AchiveFileScreen()));
              }),
          MenuItemDrawer(
              title: 'Recycle Bin',
              iconData: Icons.delete_outline,
              onPressed: (() {
                Navigator.of(context)
                    .push(CustomRoutesPage(widget: const RecyclebinScreen()));
              })),
          MenuItemDrawer(
              title: 'Storage',
              iconData: Icons.cloud_outlined,
              onPressed: (() {})),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: LinearProgressIndicator(
                    minHeight: 5,
                    value: 3,
                    color: HexColor.fromHex(AppColor.primaryBtnColor),
                  )),
              const Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  '2 GB of 5GB',
                  // textAlign: TextAlign.left,
                ),
              )
            ],
            // ),
          )
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class MenuItemDrawer extends StatelessWidget {
  MenuItemDrawer({Key? key, required this.title, this.iconData, this.onPressed})
      : super(key: key);
  final String title;
  final IconData? iconData;
  VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    Color hoverColor = HexColor.fromHex(AppColor.primaryBtnColor);
    return ListTile(
      title: Text(title),
      minVerticalPadding: 10,
      horizontalTitleGap: 8,
      minLeadingWidth: 4,
      leading: Icon(iconData),
      hoverColor: hoverColor,
      onTap: onPressed,
    );
  }
}
