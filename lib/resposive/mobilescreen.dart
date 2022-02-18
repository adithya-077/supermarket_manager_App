/* import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart'; */
import 'package:flutter/material.dart';
import 'package:flutter_application_instagram_clone/models/user_models.dart';
import 'package:flutter_application_instagram_clone/provider/user_provider.dart';
import 'package:provider/provider.dart';

class WebScreen extends StatefulWidget {
  const WebScreen({Key? key}) : super(key: key);

  @override
  State<WebScreen> createState() => _WebScreenState();
}

class _WebScreenState extends State<WebScreen> {
  @override
  Widget build(BuildContext context) {
    UserDataModels? user = Provider.of<UserdataProvider>(context).getUser;
    return Scaffold(
      body: Center(child: Text(user.userName)),
    );
  }
}
