import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter_application_instagram_clone/screens/signup_Screen.dart';
import 'package:flutter_application_instagram_clone/util/showSnackBar.dart';

import 'auth_method.dart';

Future<String> checker(
  String emailText,
  String passwrdText,
  String usernameText,
  String bioText,
  Uint8List image,
  BuildContext context,
) async {
  String isdone = 'Some error';
  if (RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(emailText) ||
      passwrdText.length >= 6 ||
      // ignore: unnecessary_null_comparison
      image != null) {
    String res = await AuthMethod().signUpMethod(
        email: emailText,
        password: passwrdText,
        username: usernameText,
        bio: bioText,
        dpImg: image);
    isdone = 'done';

    if (res != 'done') {
      showsnackbar(context: context, content: res);
    }
  }
  return isdone;
}
