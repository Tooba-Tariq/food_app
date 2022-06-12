import 'package:flutter/material.dart';

class CustomPageRoute extends PageRouteBuilder {
  final Widget builder;
  AxisDirection? direction;
  CustomPageRoute({
    required this.builder,
    this.direction = AxisDirection.left,
  }) : super(
          transitionDuration: const Duration(milliseconds: 250),
          reverseTransitionDuration: const Duration(milliseconds: 250),
          pageBuilder: (context, animation, scondaryAnimation) => builder,
        );

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: getBeginOffset(),
        end: Offset.zero,
      ).animate(animation),
      child: child,
    );
  }

  getBeginOffset() {
    switch (direction!) {
      case AxisDirection.up:
        return const Offset(0, 1);
      case AxisDirection.down:
        return const Offset(0, -1);
      case AxisDirection.left:
        return const Offset(1, 0);
      case AxisDirection.right:
        return const Offset(-1, 0);
    }
  }
}
