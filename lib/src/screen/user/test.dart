import 'package:flutter/material.dart';

class MyAppTest extends StatelessWidget {
  const MyAppTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GeeksforGeeks',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('GeeksforGeeks'),
          backgroundColor: Colors.green,
        ),
        body: const showSheet(),
      ),
    );
  }
}

class showSheet extends StatefulWidget {
  const showSheet({Key? key}) : super(key: key);

  @override
  State<showSheet> createState() => _showSheetState();
}

class _showSheetState extends State<showSheet> {
  void displayPersistentBottomSheet() {
    Scaffold.of(context).showBottomSheet<void>((BuildContext context) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.person),
            title: const Text(' My Profile '),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.book),
            title: const Text(' My Course '),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.workspace_premium),
            title: const Text(' Go Premium '),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.video_label),
            title: const Text(' Saved Videos '),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.edit),
            title: const Text(' Edit Profile '),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: const Text('LogOut'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      );
    });
  }

  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll<Color>(Colors.redAccent)),
        child: const Text(
          'Display Sheet',
          style: TextStyle(color: Colors.white),
        ),
        onPressed: displayPersistentBottomSheet,
      ),
    );
  }
}
