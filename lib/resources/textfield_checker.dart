import 'package:flutter/cupertino.dart';
//import 'package:flutter_application_instagram_clone/screens/signup_Screen.dart';
import 'package:flutter_application_instagram_clone/util/showSnackBar.dart';

import 'auth_method.dart';

Future<String> checker(
  String emailText,
  String passwrdText,
  String usernameText,
  String role,
  int imageno,
  BuildContext context,
  String mbno,
) async {
  String isdone = 'Some error';
  if (RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(emailText) ||
      passwrdText.length >= 6) {
    String res = await AuthMethod().signUpMethod(
      email: emailText,
      password: passwrdText,
      username: usernameText,
      role: role,
      dpImgno: imageno,
      mbno: mbno,
    );
    isdone = 'done';

    if (res != 'done') {
      showsnackbar(context: context, content: res);
    }
  }
  return isdone;
}
