import 'package:flutter/material.dart';

class userDataModels {
  final String userName;
  final String dpName;
  final String email;
  final List followers;
  final List following;
  final String dpUrl;
  final String userUid;
  final String mbno;

  userDataModels({
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
}
