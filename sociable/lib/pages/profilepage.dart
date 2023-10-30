// ignore_for_file: unnecessary_null_comparison, prefer_interpolation_to_compose_strings, prefer_const_constructors, prefer_is_empty

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sociable/componants/tex_box.dart';

class Profilepage extends StatefulWidget {
  const Profilepage({super.key});

  @override
  State<Profilepage> createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {
  final currentuser = FirebaseAuth.instance.currentUser;
  final userCollection = FirebaseFirestore.instance.collection("Users");
  Future<void> editField(String field) async {
    String newvalue = "";
    await showDialog(
        context: context,
        builder: (context) => AlertDialog(
              backgroundColor: Colors.grey[900],
              title: Text(
                "Edit" + field,
                style: TextStyle(color: Colors.white),
              ),
              content: SingleChildScrollView(
                child: TextField(
                  autofocus: true,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      hintText: "Enter New " + field,
                      hintStyle: TextStyle(color: Colors.grey)),
                  onChanged: (value) {
                    newvalue = value;
                  },
                ),
              ),
              actions: [
                TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      "Cencel",
                      style: TextStyle(color: Colors.white),
                    )),
                TextButton(
                    onPressed: () => Navigator.of(context).pop(newvalue),
                    child: Text(
                      "Save",
                      style: TextStyle(color: Colors.white),
                    )),
              ],
            ));
    if (newvalue.trim().length > 0) {
      await userCollection.doc(currentuser!.email!).update({field: newvalue});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Profile',
            // style: TextStyle(color: Colors.black),
          ),
        ),
        body: StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance
              .collection("Users")
              .doc(currentuser!.email!)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data != null) {
              final userData = snapshot.data?.data() as Map<String, dynamic>;
              if (userData != null) {}
              return ListView(children: [
                SizedBox(
                  height: 50,
                ),
                Icon(
                  Icons.person,
                  size: 72,
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                    child: Text(
                  currentuser!.email!,
                  style: TextStyle(color: Colors.grey[700]),
                )),
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Text(
                    "My Details",
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                ),
                TextBox(
                  text: userData['Username'],
                  sectionname: 'Username',
                  onpressed: () => editField('Username'),
                ),
                TextBox(
                  text: userData['Bio'],
                  sectionname: 'Bio',
                  onpressed: () => editField('Bio'),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Text(
                    "My Posts",
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                ),
              ]);
            } else if (snapshot.hasError) {
              return Center(
                child: Text("Error: ${snapshot.hasError}"),
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }
}
