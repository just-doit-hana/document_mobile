import 'dart:math';

import 'package:document_mobile/app/helper/shared_preference.dart';
import 'package:document_mobile/src/bussiness/quota/bloc/quota_bloc.dart';
import 'package:document_mobile/src/screen/shared/share_file_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    String? userId = SharedPreferenceHelper.instance.getString('userId');
    if (kDebugMode) {
      print('UserId $userId');
    }
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.65,
      child: ListView(
        // shrinkWrap: true,
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: 120,
            child: DrawerHeader(
              decoration: BoxDecoration(
                  color: HexColor.fromHex(AppColor.primaryBtnColor)),
              child: Text(
                'Document Management',
                textAlign: TextAlign.justify,
                style: h4StyleLight,
              ),
            ),
          ),
          MenuItemDrawer(
              title: 'Share file',
              iconData: Icons.share_outlined,
              onPressed: (() {
                Navigator.of(context)
                    .push(CustomRoutesPage(widget: const ShareFileScreen()));
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

          BlocProvider(
            create: (context) => QuotaBloc(RepositoryProvider.of(context))
              ..add(GetQuataByAccountEvent(accountId: userId!)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BlocConsumer<QuotaBloc, QoutaState>(
                  listener: (context, state) {
                    if (state is QuotaErrorState) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(state.error)));
                    }
                  },
                  builder: (context, state) {
                    if (state is QoutaLoadedState) {
                      var useage = (state.quota.result / pow(1024, 3));
                      return Column(
                        children: [
                          Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: LinearProgressIndicator(
                                minHeight: 5,
                                value: useage,
                                color:
                                    HexColor.fromHex(AppColor.primaryBtnColor),
                              )),
                          Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    '${useage.toStringAsFixed(2)} GB',
                                    style: TextStyle(
                                        color: HexColor.fromHex(
                                            AppColor.primaryTextColor)),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  const Text(
                                    'used of 5GB',
                                  ),
                                ],
                              ))
                        ],
                      );
                    }
                    return Container();
                  },
                ),
              ],
              // ),
            ),
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
