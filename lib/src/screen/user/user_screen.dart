import 'package:flutter/material.dart';

class UserAccessScreen extends StatefulWidget {
  const UserAccessScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _UserAccessScreenState createState() => _UserAccessScreenState();
}

class _UserAccessScreenState extends State<UserAccessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Manage access user')),
      body: const Center(
        child: Text('Manage user'),
      ),
    );
  }
}
