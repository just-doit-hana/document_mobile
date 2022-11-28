import 'package:flutter/material.dart';

class BottomLoader extends StatelessWidget {
  const BottomLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: SizedBox(
          height: 34,
          width: 34,
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
