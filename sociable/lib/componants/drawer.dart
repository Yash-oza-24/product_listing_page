// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sociable/componants/list_tile.dart';

class Mydrawer extends StatelessWidget {
  final void Function()? onprofiletap;
  final void Function()? onsignout;
  const Mydrawer({super.key, this.onprofiletap, this.onsignout});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey[900],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              const DrawerHeader(
                  child: Icon(
                Icons.person,
                color: Colors.white,
                size: 64,
              )),
              Mylisttile(
                  onTap: () => Navigator.pop(context),
                  icon: Icons.home,
                  text: "H O M E"),
              Mylisttile(
                  onTap: onprofiletap,
                  icon: Icons.person,
                  text: "P R O F I L E"),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 25.0),
            child: Mylisttile(
                onTap: onsignout, icon: Icons.logout, text: "L O G O U T"),
          ),
        ],
      ),
    );
  }
}
