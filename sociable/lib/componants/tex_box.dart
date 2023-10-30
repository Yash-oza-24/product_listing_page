// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class TextBox extends StatelessWidget {
  final String text;
  final String sectionname;
  final void Function()? onpressed;
  const TextBox(
      {super.key,
      required this.text,
      required this.sectionname,
      this.onpressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(10)),
      padding: EdgeInsets.only(left: 15, bottom: 15),
      margin: EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                sectionname,
                style: TextStyle(color: Colors.grey[500]),
              ),
              IconButton(
                  onPressed: onpressed,
                  icon: Icon(
                    Icons.settings,
                    color: Colors.grey[400],
                  ))
            ],
          ),
          Text(text),
        ],
      ),
    );
  }
}
