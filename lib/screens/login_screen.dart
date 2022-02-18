//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';
//import 'package:flutter_application_instagram_clone/dummyLoader/dummyLoader.dart';
import 'package:flutter_application_instagram_clone/resources/auth_method.dart';
import 'package:flutter_application_instagram_clone/screens/signup_Screen.dart';
import 'package:flutter_application_instagram_clone/util/colors.dart';
import 'package:flutter_application_instagram_clone/util/showSnackBar.dart';
import 'package:flutter_application_instagram_clone/widgets/textinput_template.dart';
//import 'package:flutter_svg/flutter_svg.dart';

import '../resposive/mobilescreen.dart';
import '../resposive/responsive_screen_layout.dart';
import '../resposive/webscreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailText = TextEditingController();
  final TextEditingController _passwrdText = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    _emailText.dispose();
    _passwrdText.dispose();
  }

  void loginUser() async {
    String res = await AuthMethod()
        .loginMethod(email: _emailText.text, password: _passwrdText.text);

    if (res == 'done') {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const ResponsiveLayout(
            mobileScreen: MoblieScreen(),
            webScreen: WebScreen(),
          ),
        ),
      );
    } else {
      showsnackbar(context: context, content: res);
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: screenSize.height,
            padding: const EdgeInsets.symmetric(horizontal: 32),
            width: double.infinity,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: Container(),
                    flex: 1,
                  ),
                  SizedBox(
                    height: screenSize.height * 0.02,
                    width: double.infinity,
                  ),
                  TextInputTemplate(
                      txcontroller: _emailText,
                      ispassword: false,
                      keyType: TextInputType.emailAddress,
                      hintText: "enter your email"),
                  SizedBox(
                    height: screenSize.height * 0.05,
                    width: double.infinity,
                  ),
                  TextInputTemplate(
                      txcontroller: _passwrdText,
                      ispassword: true,
                      keyType: TextInputType.text,
                      hintText: "enter your password"),
                  SizedBox(
                    height: screenSize.height * 0.05,
                    width: double.infinity,
                  ),
                  GestureDetector(
                    onTap: loginUser,
                    child: Container(
                      child: const Text(
                        "Log in",
                        style: TextStyle(fontSize: 15),
                      ),
                      alignment: Alignment.center,
                      width: double.infinity,
                      height: screenSize.height * 0.05,
                      decoration: BoxDecoration(
                          color: blueColor,
                          borderRadius: BorderRadius.circular(4)),
                    ),
                  ),
                  SizedBox(
                    height: screenSize.height * 0.05,
                    width: double.infinity,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "don't have an account?",
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, SignupScreen.routeName);
                        },
                        child: const Text(" Sgin up",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold)),
                      )
                    ],
                  ),
                  Flexible(
                    child: Container(),
                    flex: 2,
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
