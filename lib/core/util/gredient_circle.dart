import 'package:flutter/material.dart';

class GradientCircle extends StatelessWidget {
  const GradientCircle({
    Key? key,
    this.radius = 100,
    this.begin = Alignment.topCenter,
    this.end = Alignment.bottomCenter,
  }) : super(key: key);
  final double radius;
  final dynamic begin;
  final dynamic end;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: const [
              Color(0xFFFFC901),
              Color(0xFFF2A902),
            ],
            // stops: [0.2, 0.8],
            begin: begin,
            end: end,
          ),
        ),
      ),
    );
  }
}
