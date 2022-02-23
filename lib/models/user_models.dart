import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_auth/firebase_auth.dart';

class UserDataModels {
  final String userName;
  final String dpName;
  final String email;
  final List followers;
  final List following;
  final int dpno;
  final String userUid;
  final String mbno;
  final String bio;

  UserDataModels({
    required this.userName,
    required this.dpName,
    required this.email,
    required this.followers,
    required this.following,
    required this.dpno,
    required this.userUid,
    required this.mbno,
    required this.bio,
  });

  Map<String, dynamic> toJson() => {
        "bio": bio,
        "username": userName,
        "displayname": dpName,
        "email": email,
        "follwers": followers,
        "following": following,
        "dpno": dpno,
        "userid": userUid,
        "mobileno": mbno,
      };

  static UserDataModels fromsnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return UserDataModels(
      dpName: snapshot['displayname'],
      dpno: snapshot['dpno'],
      email: snapshot['email'],
      followers: snapshot['follwers'],
      following: snapshot['following'],
      mbno: snapshot['mobileno'],
      userName: snapshot['username'],
      userUid: snapshot['userid'],
      bio: snapshot['bio'],
    );
  }
}
