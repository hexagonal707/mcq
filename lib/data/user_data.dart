import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mcq/models/user_model.dart';

class UserData {
  static User fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        username: json['username'],
        email: json['email'],
      );

  static Future<User> getUserData(String uid) async {
    var snapshot =
        await FirebaseFirestore.instance.collection('user-data').doc(uid).get();
    if (snapshot.exists && snapshot.data() != null) {
      var data = snapshot.data()!;
      return UserData.fromJson(data);
    } else {
      throw Exception('Failed to load user data');
    }
  }
}
