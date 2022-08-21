import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';

import '../util/colors.dart';

class BarcodeProd extends StatefulWidget {
  static const routName = 'barcode-screen';

  const BarcodeProd({
    Key? key,
  }) : super(key: key);

  @override
  State<BarcodeProd> createState() => _BarcodeProdState();
}

class _BarcodeProdState extends State<BarcodeProd> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
                child: Card(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: BarcodeWidget(
                  barcode: Barcode.code128(),
                  data: args['data'],
                  drawText: false,
                  width: 400,
                  height: 200,
                ),
              ),
            )),
          ),
          Text(
            'PRODUCT ID : ' + args['data'],
            style: const TextStyle(color: Colors.white, fontSize: 30),
          )
        ],
      ),
    );
  }
}
