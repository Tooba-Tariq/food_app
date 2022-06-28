import 'package:flutter/material.dart';

class ErrorMessage extends StatelessWidget {
  const ErrorMessage({
    Key? key,
    required this.message,
  }) : super(key: key);
  final String message;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Icon(
            Icons.warning_rounded,
            color: Colors.red,
          ),
        ),
        Padding(
          padding:const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(message),
        ),
      ],
    );
  }
}
