// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:sociable/pages/login.dart';
import 'package:sociable/pages/register.dart';

class loginregister extends StatefulWidget {
  const loginregister({super.key});

  @override
  State<loginregister> createState() => _loginregisterState();
}

class _loginregisterState extends State<loginregister> {
  bool showloginpage = true;
  void togglepage() {
    setState(() {
      showloginpage = !showloginpage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showloginpage) {
      return Loginscreen(
        onTap: togglepage,
      );
    } else {
      return registration(
        onTap: togglepage,
      );
    }
  }
}
