import 'package:flutter/material.dart';

class RecyclebinScreen extends StatefulWidget {
  const RecyclebinScreen({Key? key}) : super(key: key);

  @override
  _RecyclebinScreenState createState() => _RecyclebinScreenState();
}

class _RecyclebinScreenState extends State<RecyclebinScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Recycle Bin')),
        body: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3),
          children: [Text('123'), Text('123'), Text('12')],
        ));
  }
}
