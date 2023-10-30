// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class Deletebutton extends StatelessWidget {
  void Function()? onTap;
  final double? iconSize;
  Deletebutton({super.key, required this.onTap, this.iconSize});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: GestureDetector(
        onTap: onTap,
        child: Icon(
          Icons.cancel,
          size: iconSize ?? 24,
          color: Colors.grey,
        ),
      ),
    );
  }
}
