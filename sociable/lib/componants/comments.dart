// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Comments extends StatelessWidget {
  final String text;
  final String user;
  final String time;

  const Comments(
      {super.key, required this.text, required this.user, required this.time});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(4),
        ),
        margin: EdgeInsets.only(bottom: 5),
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(text),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Text(
                    user,
                    style: TextStyle(color: Colors.grey[400]),
                  ),
                  Text(" . ", style: TextStyle(color: Colors.grey[400])),
                  Text(time, style: TextStyle(color: Colors.grey[400]))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
