import 'package:flutter/material.dart';

class SharedScreen extends StatefulWidget {
  const SharedScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SharedScreenState createState() => _SharedScreenState();
}

class _SharedScreenState extends State<SharedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Shared file member')),
      body: const Center(
        child: Text('Shared file member'),
      ),
    );
  }
}
