import 'package:flutter/material.dart';
import 'package:flutter_application_instagram_clone/util/colors.dart';

class CreateBarcode extends StatefulWidget {
  const CreateBarcode({Key? key}) : super(key: key);

  static const String routName = 'create-barcode';

  @override
  State<CreateBarcode> createState() => _CreateBarcodeState();
}

class _CreateBarcodeState extends State<CreateBarcode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
      ),
      body: const Center(child: Text('barcode creation')),
    );
  }
}
