import 'package:flutter/material.dart';

class FullScreenSearchFolder extends ModalRoute {
  @override
  Color? get barrierColor => Colors.black.withOpacity(0.6);

  @override
  bool get barrierDismissible => false;

  @override
  String? get barrierLabel => null;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: TextField(
                        autofocus: true,
                        decoration: InputDecoration(
                            hintText: 'Search in Document',
                            filled: true,
                            fillColor: Colors.grey.shade500,
                            suffixIcon: const Icon(Icons.close),
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(30)),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 0, horizontal: 20)))),
                const SizedBox(
                  width: 10,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Cancel'))
              ],
            ),
            SizedBox(
              width: 20,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 5),
              child: Text('Recently Searched',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            const ListTile(
              title: Text('Flutter tutorials'),
              leading: Icon(Icons.search),
              trailing: Icon(Icons.close),
            ),
          ],
        ),
      )),
    );
  }

  @override
  bool get maintainState => true;

  @override
  bool get opaque => false;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 500);
}

@override
Widget buildTransitions(BuildContext context, Animation<double> animation,
    Animation<double> secondaryAnimation, Widget child) {
  // add fade animation
  return FadeTransition(
    opacity: animation,
    // add slide animation
    child: SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(0, -1),
        end: Offset.zero,
      ).animate(animation),
      child: child,
    ),
  );
}
