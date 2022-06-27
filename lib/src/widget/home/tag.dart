// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../../services/item/item_crud.dart';

class Tag extends StatelessWidget {
  String title;
  Color color;
  Tag({
    Key? key,
    required this.title,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: TextButton(
        style: ElevatedButton.styleFrom(primary: color),
        onPressed: () async {
          await ItemCRUD.readItemData();
        },
        child: Text(
          title,
        ),
      ),
    );
  }
}
