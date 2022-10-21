import 'package:flutter/material.dart';

class SharedScreen extends StatefulWidget {
  const SharedScreen({Key? key}) : super(key: key);

  @override
  _SharedScreenState createState() => _SharedScreenState();
}

class _SharedScreenState extends State<SharedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Shared Member')),
      body: Center(
        child: Text('Shared Member test'),
      ),
    );
    ;
  }
}
