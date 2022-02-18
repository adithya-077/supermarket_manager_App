import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_auth/firebase_auth.dart';

class UserDataModels {
  final String userName;
  final String dpName;
  final String email;
  final List followers;
  final List following;
  final String dpUrl;
  final String userUid;
  final String mbno;

  UserDataModels({
    required this.userName,
    required this.dpName,
    required this.email,
    required this.followers,
    required this.following,
    required this.dpUrl,
    required this.userUid,
    required this.mbno,
  });

  Map<String, dynamic> toJson() => {
        'username': userName,
        'dpname': dpName,
        'email': email,
        'follwers': followers,
        'following': followers,
        'dpurl': dpUrl,
        'userid': userUid,
        'displayname': dpName,
        'mobileno': mbno,
      };
  static UserDataModels fromsnap(DocumentSnapshot snap) {
    var snapshot = snap as Map<String, dynamic>;

    return UserDataModels(
      dpName: snapshot['displayname'],
      dpUrl: snapshot['dpurl'],
      email: snapshot['email'],
      followers: snapshot['followers'],
      following: snapshot['following'],
      mbno: snapshot['mobileno'],
      userName: snapshot['username'],
      userUid: snapshot['userid'],
    );
  }
}
