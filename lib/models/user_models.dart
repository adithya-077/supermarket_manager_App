import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_auth/firebase_auth.dart';

class UserDataModels {
  final String userName;
  final String email;
  final int dpno;
  final String userUid;
  final String mbno;
  final String role;

  UserDataModels({
    required this.userName,
    required this.email,
    required this.dpno,
    required this.userUid,
    required this.mbno,
    required this.role,
  });

  Map<String, dynamic> toJson() => {
        "role": role,
        "username": userName,
        "email": email,
        "dpno": dpno,
        "userid": userUid,
        "mobileno": mbno,
      };

  static UserDataModels fromsnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return UserDataModels(
      dpno: snapshot['dpno'],
      email: snapshot['email'],
      role: snapshot['role'],
      mbno: snapshot['mobileno'],
      userName: snapshot['username'],
      userUid: snapshot['userid'],
    );
  }
}
