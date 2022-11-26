import 'package:flutter/material.dart';

import '../../../app/util/util.dart';

class UserAccessScreen extends StatelessWidget {
  const UserAccessScreen({Key? key, required this.fileId}) : super(key: key);
  final String fileId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Manage access',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontFamily: AppConstant.poppinsFont,
                  fontSize: 17)),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: Icon(Icons.person_add_alt_outlined),
            )
          ],
        ),
        body: ListView.builder(
            itemCount: 20,
            scrollDirection: Axis.vertical,
            itemBuilder: ((context, index) {
              return Card(
                child: ListTile(
                    title: const Text('Tran Quang Huy'),
                    subtitle: const Text('Owner'),
                    leading: CircleAvatar(
                        backgroundColor:
                            const Color.fromARGB(179, 181, 180, 180),
                        radius: 24,
                        child: Text(
                          'huytq',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: HexColor.fromHex(AppColor.blackTextColor)),
                        )),
                    trailing: const Text('Editor')),
              );
            })));
  }
}
