import 'dart:typed_data';
import 'package:flutter/material.dart';
//import 'package:flutter_application_instagram_clone/resources/auth_method.dart';
import 'package:flutter_application_instagram_clone/resources/textfield_checker.dart';
import 'package:flutter_application_instagram_clone/util/colors.dart';
import 'package:flutter_application_instagram_clone/util/image_picker.dart';
import 'package:flutter_application_instagram_clone/widgets/textinput_template.dart';
//import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

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
  Uint8List? _image;

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

  void selectImgae() async {
    Uint8List? _img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = _img;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
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
                      _image != null
                          ? CircleAvatar(
                              radius: 50, backgroundImage: MemoryImage(_image!))
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
                        _image!,
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
