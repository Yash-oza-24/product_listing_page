import 'package:cloud_firestore/cloud_firestore.dart';

class MESSAGE {
  final String senderName;
  final String recevierName;
  final String message;
  final Timestamp timestemp;

  MESSAGE(
      {required this.senderName,
      required this.recevierName,
      required this.timestemp,
      required this.message});

  Map<String, dynamic> toMap() {
    return {
      'SenderName': message,
      "RecieverName": recevierName,
      'Message': message,
      'Timestemp': timestemp
    };
  }
}
