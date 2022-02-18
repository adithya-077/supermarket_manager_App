import 'package:flutter/material.dart';

class Dummyloader extends StatelessWidget {
  const Dummyloader({Key? key}) : super(key: key);

  static const String routName = 'dummy-loader';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
            child: CircularProgressIndicator(
      color: Colors.white,
    )));
  }
}
