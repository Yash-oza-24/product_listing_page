// ignore_for_file: unused_local_variable, non_constant_identifier_names, unused_field

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sociable/model/message.dart';

class Chatservices extends ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> sendMessage(String receivername, String Message) async {
    final String currentusername = _firebaseAuth.currentUser!.email!;
    final Timestamp timestamp = Timestamp.now();

    MESSAGE newmessage = MESSAGE(
        senderName: currentusername,
        recevierName: receivername,
        timestemp: timestamp,
        message: Message);

    List<String> ids = [currentusername, receivername];
    ids.sort();
    String chatroomid = ids.join("_");

    await _firestore
        .collection("chat_rooms")
        .doc(chatroomid)
        .collection("Messages")
        .add(newmessage.toMap());
  }

  Stream<QuerySnapshot> getMessages(String username, String Otherusername) {
    List<String> names = [username, Otherusername];
    names.sort();
    String chatroomid = names.join("_");

    return _firestore
        .collection('chat_rooms')
        .doc(chatroomid)
        .collection('Messages')
        .orderBy('timestamp', descending: false)
        .snapshots();
  }
}
