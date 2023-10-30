// ignore_for_file: prefer_const_constructors, unused_import

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sociable/auth/auth.dart';
import 'package:sociable/auth/login_register.dart';

import 'package:sociable/pages/register.dart';
import 'package:sociable/themes/dark_theme.dart';
import 'package:sociable/themes/light_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: darkTheme,
      title: 'Flutter',
      theme: lightTheme,
      home: Authpage(),
    );
  }
}
