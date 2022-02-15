import 'package:flutter/material.dart';

class TextInputTemplate extends StatefulWidget {
  late TextEditingController txcontroller;
  final TextInputType keyType;
  final bool ispassword;
  final String hintText;

  TextInputTemplate(
      {required this.txcontroller,
      required this.ispassword,
      required this.keyType,
      required this.hintText,
      Key? key})
      : super(key: key);

  @override
  _TextInputTemplateState createState() => _TextInputTemplateState();
}

class _TextInputTemplateState extends State<TextInputTemplate> {
  @override
  Widget build(BuildContext context) {
    final broderTemp =
        OutlineInputBorder(borderSide: Divider.createBorderSide(context));
    return TextField(
      decoration: InputDecoration(
          border: broderTemp,
          hintText: widget.hintText,
          focusedBorder: broderTemp,
          enabledBorder: broderTemp,
          filled: true,
          contentPadding: const EdgeInsets.all(8)),
      obscureText: widget.ispassword,
      keyboardType: widget.keyType,
      onChanged: (val) {
        widget.txcontroller.text = val;
      },
    );
  }
}
