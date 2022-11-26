import 'package:flutter/material.dart';

class CopytoScreen extends StatelessWidget {
  const CopytoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Copy To'),
      ),
      body: const Center(
        child: Text('Copy file'),
      ),
    );
  }
}
