// ignore_for_file: camel_case_types, must_be_immutable

import 'package:flutter/material.dart';

class likebutton extends StatelessWidget {
  final bool isLiked;
  void Function()? onTap;
   likebutton({super.key, required this.isLiked , required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(
        isLiked ? Icons.favorite : Icons.favorite_border,
        color: isLiked? Colors.red:Colors.grey,
        ),
        
    );
  }
}
