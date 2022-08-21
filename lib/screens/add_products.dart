import 'package:flutter/material.dart';
import 'package:flutter_application_instagram_clone/resources/product_checker.dart';
import 'package:flutter_application_instagram_clone/util/colors.dart';
import 'package:flutter_application_instagram_clone/util/showSnackBar.dart';

import '../widgets/textinput_template.dart';

class AddProductsScreen extends StatefulWidget {
  const AddProductsScreen({Key? key}) : super(key: key);
  static String routName = 'add-products';

  @override
  _AddProductsScreenState createState() => _AddProductsScreenState();
}

class _AddProductsScreenState extends State<AddProductsScreen> {
  final TextEditingController _productName = TextEditingController();
  final TextEditingController _prodoctUid = TextEditingController();
  final TextEditingController _prodoctQuantity = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    _prodoctUid.dispose();
    _productName.dispose();
    _prodoctQuantity.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: mobileBackgroundColor,
        ),
        body: Container(
          height: screenSize.height,
          padding: const EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Flexible(
              child: Container(),
              flex: 1,
            ),
            SizedBox(
              height: screenSize.height * 0.02,
              width: double.infinity,
            ),
            TextInputTemplate(
                txcontroller: _productName,
                ispassword: false,
                keyType: TextInputType.emailAddress,
                hintText: "enter product name"),
            SizedBox(
              height: screenSize.height * 0.05,
              width: double.infinity,
            ),
            TextInputTemplate(
                txcontroller: _prodoctUid,
                ispassword: true,
                keyType: TextInputType.text,
                hintText: "enter product id"),
            SizedBox(
              height: screenSize.height * 0.05,
              width: double.infinity,
            ),
            TextInputTemplate(
                txcontroller: _prodoctQuantity,
                ispassword: true,
                keyType: TextInputType.number,
                hintText: "enter product quantity"),
            SizedBox(
              height: screenSize.height * 0.05,
              width: double.infinity,
            ),
            GestureDetector(
              onTap: () async {
                String isAdded = await prochecker(
                    productName: _productName.text,
                    productUid: _prodoctUid.text,
                    productQantity: _prodoctQuantity.text,
                    context: context);
                if (isAdded == 'done') {
                  showsnackbar(context: context, content: 'product added');
                  Navigator.of(context).pop();
                }
              },
              child: Container(
                child: const Text(
                  "add product",
                  style: TextStyle(fontSize: 15),
                ),
                alignment: Alignment.center,
                width: double.infinity,
                height: screenSize.height * 0.05,
                decoration: BoxDecoration(
                    color: blueColor, borderRadius: BorderRadius.circular(4)),
              ),
            ),
            SizedBox(
              height: screenSize.height * 0.05,
              width: double.infinity,
            ),
            Flexible(
              child: Container(),
              flex: 2,
            ),
          ]),
        ),
      ),
    );
  }
}
