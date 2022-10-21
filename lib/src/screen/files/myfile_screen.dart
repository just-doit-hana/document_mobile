import 'package:flutter/material.dart';

class MyfileScreen extends StatefulWidget {
  const MyfileScreen({Key? key}) : super(key: key);

  @override
  _MyfileScreenState createState() => _MyfileScreenState();
}

class _MyfileScreenState extends State<MyfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My files')),
      body: Center(
        child: Text('my file test'),
      ),
    );
  }
}
