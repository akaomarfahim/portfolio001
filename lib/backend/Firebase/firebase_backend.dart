import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class FirebaseAPI {
  static DatabaseReference connect = FirebaseDatabase.instance.ref('portfolio');

  static Future<int> getLastKey(String address) async {
    DatabaseReference ref = connect.child(address);
    final snapshot = await ref.get();
    return int.tryParse(snapshot.children.last.key ?? '-1') ?? -1;
  }

  static Future<int> getNewItemKey(String address) async {
    try {
      DatabaseReference ref = connect.child(address);
      final snapshot = await ref.get();
      int key = int.tryParse(snapshot.children.last.key ?? '-1') ?? -1;
      return ++key;
    } catch (e) {
      debugPrint('getNewItemkey - Error ;$e');
      return 0;
    }
  }

  static Future<bool> addItem({required String address, required Map<String, dynamic> data}) async {
    debugPrint('Adding Item');
    try {
      int key = await getNewItemKey(address);
      debugPrint('KEY $key');
      DatabaseReference ref = connect.child(address).child(key.toString());
      await ref.update(data);
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<bool> updateItem({required String address, required int? key, required Map<String, dynamic> data}) async {
    if (key == null) return false;
    try {
      DatabaseReference ref = connect.child(address).child(key.toString());
      await ref.update(data);
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<bool> updateData({required String address, required Map<String, dynamic> data}) async {
    try {
      DatabaseReference ref = connect.child(address);
      await ref.update(data);
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<bool> removeItem({required String address, required int? key}) async {
    if (key == null) return false;
    try {
      DatabaseReference ref = connect.child(address).child(key.toString());
      await ref.remove();
      return true;
    } catch (e) {
      return false;
    }
  }
}
