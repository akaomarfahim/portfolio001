import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import '../../../backend/Firebase/firebase_backend.dart';
import '../../../models/user_model.dart';

Future<bool> auth(String username, String password) async {
  debugPrint('auth 1 - $username');
  if (username.isEmpty || password.isEmpty) return false;
  try {
    DatabaseReference ref = FirebaseAPI.connect;
    final snapshot = await ref.child('users').child(username.trim()).get();
    debugPrint(snapshot.value.toString());
    if (!snapshot.exists) return false;

    final userdata = UserModel.fromMap(Map<String, dynamic>.from(snapshot.value as Map));
    debugPrint('USER :: ${UserModel.user}');

    if (userdata.username == username.trim() && userdata.password == password.trim()) {
      UserModel.user = userdata;
      debugPrint('USER DATA ::: ${userdata.toString()}');
      return true;
    } else {
      return false;
    }
  } catch (e) {
    debugPrint('Error: $e');
    return false;
  }
}
