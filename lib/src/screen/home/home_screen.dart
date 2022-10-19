import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);
  // final DioClient dioClient;

  PreferredSizeWidget appBar(BuildContext context) {
    return AppBar(
      title: Text(
        "Test",
        style: Theme.of(context).textTheme.headline2,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // actions: [],
        title: const Text('Home'),
      ),
    );
  }
}
