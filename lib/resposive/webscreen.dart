import 'package:flutter/material.dart';

class MoblieScreen extends StatefulWidget {
  const MoblieScreen({Key? key}) : super(key: key);

  @override
  State<MoblieScreen> createState() => _MoblieScreenState();
}

class _MoblieScreenState extends State<MoblieScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("from web")),
    );
  }
}
