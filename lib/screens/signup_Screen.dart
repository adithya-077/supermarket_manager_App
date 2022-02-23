import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_application_instagram_clone/assets/profilePic/list_propic.dart';
//import 'package:flutter_application_instagram_clone/resources/auth_method.dart';
import 'package:flutter_application_instagram_clone/resources/textfield_checker.dart';
import 'package:flutter_application_instagram_clone/util/colors.dart';
import 'package:flutter_application_instagram_clone/widgets/textinput_template.dart';
//import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);
  static const String routeName = 'sgin-up-page';

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailText = TextEditingController();
  final TextEditingController _passwrdText = TextEditingController();
  final TextEditingController _bioText = TextEditingController();
  final TextEditingController _usernameText = TextEditingController();
  final TextEditingController _dname = TextEditingController();
  final TextEditingController _mbno = TextEditingController();
  late int prono = 999;

  @override
  void dispose() {
    super.dispose();
    _emailText.dispose();
    _passwrdText.dispose();
    _bioText.dispose();
    _usernameText.dispose();
    _mbno.dispose();
    _dname.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    List propics = Provider.of<ProfilePicFetcher>(context).proPic;

    void selectImgae() async {
      showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return SizedBox(
              height: screenSize.height * 0.4,
              child: Column(children: [
                SizedBox(
                  height: screenSize.height * 0.2,
                  width: double.infinity,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: propics.length,
                      itemBuilder: (_, idx) {
                        return Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(150),
                              color: blueColor,
                            ),
                            width: screenSize.width * 0.4,
                            child: GestureDetector(
                              onTap: (() {
                                setState(() {
                                  prono = idx;
                                });
                                Navigator.of(context).pop();
                              }),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(150),
                                child: Image.asset(
                                  propics[idx],
                                  fit: BoxFit.fill,
                                  height: 100,
                                  width: double.infinity,
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('exit')),
                ),
              ]),
            );
          });
    }

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: screenSize.height,
            padding: const EdgeInsets.symmetric(horizontal: 32),
            width: double.infinity,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: Container(),
                    flex: 2,
                  ),
                  Stack(
                    children: [
                      prono != 999
                          ? Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(150),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(150),
                                child: Image.asset(propics[prono],
                                    fit: BoxFit.contain),
                              ),
                            )
                          : const CircleAvatar(
                              radius: 50,
                              backgroundImage: NetworkImage(
                                  'https://st3.depositphotos.com/4111759/13425/v/600/depositphotos_134255532-stock-illustration-profile-placeholder-male-default-profile.jpg')),
                      Positioned(
                          bottom: -10,
                          right: -5,
                          child: IconButton(
                              color: Colors.blue,
                              onPressed: () {
                                selectImgae();
                              },
                              icon: const Icon(Icons.add_a_photo)))
                    ],
                  ),
                  SizedBox(
                    height: screenSize.height * 0.02,
                    width: double.infinity,
                  ),
                  TextInputTemplate(
                    txcontroller: _emailText,
                    ispassword: false,
                    keyType: TextInputType.emailAddress,
                    hintText: "enter your email",
                  ),
                  SizedBox(
                    height: screenSize.height * 0.04,
                    width: double.infinity,
                  ),
                  TextInputTemplate(
                      txcontroller: _passwrdText,
                      ispassword: true,
                      keyType: TextInputType.text,
                      hintText: "enter your password"),
                  SizedBox(
                    height: screenSize.height * 0.04,
                    width: double.infinity,
                  ),
                  TextInputTemplate(
                      txcontroller: _usernameText,
                      ispassword: false,
                      keyType: TextInputType.text,
                      hintText: "enter a username"),
                  SizedBox(
                    height: screenSize.height * 0.04,
                    width: double.infinity,
                  ),
                  TextInputTemplate(
                      txcontroller: _bioText,
                      ispassword: false,
                      keyType: TextInputType.text,
                      hintText: "enter a bio"),
                  SizedBox(
                    height: screenSize.height * 0.04,
                    width: double.infinity,
                  ),
                  TextInputTemplate(
                      txcontroller: _mbno,
                      ispassword: false,
                      keyType: TextInputType.text,
                      hintText: "enter mobile number"),
                  SizedBox(
                    height: screenSize.height * 0.04,
                    width: double.infinity,
                  ),
                  TextInputTemplate(
                      txcontroller: _dname,
                      ispassword: false,
                      keyType: TextInputType.text,
                      hintText: "enter a display name"),
                  SizedBox(
                    height: screenSize.height * 0.04,
                    width: double.infinity,
                  ),
                  GestureDetector(
                    onTap: () async {
                      String isdone = await checker(
                        _emailText.text,
                        _passwrdText.text,
                        _usernameText.text,
                        _bioText.text,
                        prono,
                        context,
                        _dname.text,
                        _mbno.text,
                      );
                      if (isdone == 'done') {
                        Navigator.of(context).pop();
                      }
                    },
                    child: Container(
                      child: const Text(
                        "Create user",
                        style: TextStyle(fontSize: 15),
                      ),
                      alignment: Alignment.center,
                      width: double.infinity,
                      height: screenSize.height * 0.04,
                      decoration: BoxDecoration(
                          color: blueColor,
                          borderRadius: BorderRadius.circular(4)),
                    ),
                  ),
                  SizedBox(
                    height: screenSize.height * 0.04,
                    width: double.infinity,
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
