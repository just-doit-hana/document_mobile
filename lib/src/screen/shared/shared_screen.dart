import 'package:document_mobile/app/animation/routes_animation.dart';
import 'package:document_mobile/app/util/util.dart';
import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

import '../user/user_screen.dart';

class SharedScreen extends StatefulWidget {
  const SharedScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SharedScreenState createState() => _SharedScreenState();
}

class _SharedScreenState extends State<SharedScreen> {
  String ietmValue = 'Editor';
  var item = ['Editor', 'Viewer'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Shared file member',
            style: h4StyleLight,
            textAlign: TextAlign.left,
          ),
          actions: [
            PopupMenuButton(
              icon: const Icon(Icons.more_vert_outlined),
              itemBuilder: ((context) => [
                    PopupMenuItem(
                      value: 1,
                      child: Row(
                        children: const [
                          Icon(Icons.security_outlined),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Manage Access',
                          )
                        ],
                      ),
                    )
                  ]),
              offset: const Offset(0, 70),
              elevation: 2,
              onSelected: (value) {
                if (value == 1) {
                  Navigator.of(context).push(CustomRoutesPage(
                      widget: const UserAccessScreen(
                    fileId: '',
                  )));
                }
              },
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: (Column(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,

            children: [
              const SizedBox(
                height: 100,
                width: double.infinity,
                child: SelectedUser(),
              ),
              SizedBox(
                width: double.infinity,
                child: DropdownButton(
                  // Initial Value
                  value: ietmValue,

                  // Down Arrow Icon
                  icon: const Icon(Icons.keyboard_arrow_down),

                  // Array list of items
                  items: item.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  // After selecting the desired option,it will
                  // change button value to selected value
                  onChanged: (String? newValue) {
                    setState(() {
                      ietmValue = newValue!;
                    });
                  },
                ),
              ),
              Row(
                children: [
                  Switch(value: true, onChanged: ((value) {})),
                  const Text('Send notification to share member'),
                ],
              )
            ],
          )),
        ));
  }
}

class User {
  final int id;
  final String name;
  const User({required this.id, required this.name});
}

class SelectedUser extends StatefulWidget {
  const SelectedUser({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SelectedUserState createState() => _SelectedUserState();
}

class _SelectedUserState extends State<SelectedUser> {
  static final List<User> _user = [
    const User(id: 1, name: 'Quang Huy'),
    const User(id: 2, name: 'Quang Huy'),
    const User(id: 3, name: 'Quang Huy'),
    const User(id: 4, name: 'Quang Huy'),
    const User(id: 5, name: 'Quang Huy'),
    const User(id: 6, name: 'Quang Huy'),
    const User(id: 7, name: 'Quang Huy'),
    const User(id: 8, name: 'Quang Huy'),
    const User(id: 9, name: 'Quang Huy'),
    const User(id: 10, name: 'Quang Huy'),
    const User(id: 11, name: 'Quang Huy'),
    const User(id: 12, name: 'Quang Huy')
  ];

  final _item =
      _user.map((user) => MultiSelectItem<User>(user, user.name)).toList();
  List<User> selectedUser = [];

  @override
  void initState() {
    super.initState();
    selectedUser = _user;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          // padding:
          //     const EdgeInsets.only(top: 10, right: 20, left: 20, bottom: 20),
          child: Column(
            children: <Widget>[
              // const SizedBox(
              //   height: 40,
              // ),
              MultiSelectDialogField(
                searchHint: 'search member',
                searchTextStyle: const TextStyle(color: Colors.redAccent),
                searchable: true,
                title: const Text('Member'),
                // selectedItemsTextStyle: TextStyle(color: Colors.white10),
                selectedColor: HexColor.fromHex(AppColor.primaryTextColor),
                // decoration: BoxDecoration(
                //     border: Border.all(
                //         width: 1.4, color: Colors.red.withOpacity(0.2)),
                //     color: HexColor.fromHex(AppColor.whiteTextColor),
                //     borderRadius: const BorderRadius.all(Radius.circular(10))),
                buttonIcon: const Icon(Icons.person_add_alt_1_outlined),
                buttonText: const Text(
                  'Member access',

                  // style: h4StyleLight,
                ),
                items: _item,
                onConfirm: ((values) {
                  selectedUser = values;
                }),
                confirmText: Text(
                  'Share',
                  style: TextStyle(
                      color: HexColor.fromHex(AppColor.primaryTextColor)),
                ),
                cancelText: const Text('Cancel'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
