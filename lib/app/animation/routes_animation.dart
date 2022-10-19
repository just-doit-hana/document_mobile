import 'package:flutter/cupertino.dart';

class CustomRoutesPage extends PageRouteBuilder {
  final Widget widget;
  CustomRoutesPage({required this.widget})
      : super(pageBuilder: (BuildContext context, Animation animation,
            Animation secondaryAnimation) {
          return widget;
        }, transitionsBuilder: (BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child) {
          return SlideTransition(
            position:
                Tween<Offset>(begin: const Offset(-1.0, 0.0), end: Offset.zero)
                    .animate(animation),
            child: child,
          );
        });
}
