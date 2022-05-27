import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({
    Key? key,
    this.height = 250,
    this.width = 250,
  }) : super(key: key);
  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Hero(
        tag: '/logo',
        child: Image.asset('assets/images/logo.png'),
      ),
    );
  }
}
