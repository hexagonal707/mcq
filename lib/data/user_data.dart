import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:mcq/models/user_model.dart' as u;

class UserData extends ChangeNotifier {
  u.User? userdata;

  static u.User fromJson(Map<String, dynamic> json) => u.User(
        id: json['id'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        username: json['username'],
        email: json['email'],
      );

  Future<u.User> getUserData() async {
    final uid = FirebaseAuth.instance.currentUser!.uid;

    var snapshot =
        await FirebaseFirestore.instance.collection('user-data').doc(uid).get();
    if (snapshot.exists && snapshot.data() != null) {
      var data = UserData.fromJson(snapshot.data()!);
      userdata = data;
      notifyListeners();
      return data;
    } else {
      throw Exception('Failed to load user data');
    }
  }
}
