import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_instagram_clone/provider/product_provider.dart';
import 'package:flutter_application_instagram_clone/resources/auth_method.dart';
import 'package:flutter_application_instagram_clone/screens/barcodeProduct.dart';
import 'package:flutter_application_instagram_clone/util/colors.dart';
import 'package:flutter_application_instagram_clone/util/showSnackBar.dart';
import 'package:provider/provider.dart';

class CreateBarcode extends StatefulWidget {
  const CreateBarcode({Key? key}) : super(key: key);

  static const String routName = 'create-barcode';

  @override
  State<CreateBarcode> createState() => _CreateBarcodeState();
}

class _CreateBarcodeState extends State<CreateBarcode> {
  @override
  Widget build(BuildContext context) {
    final screensize = MediaQuery.of(context).size;

    final List allProducts =
        Provider.of<ProductProvider>(context, listen: false).getProducts;
    Provider.of<ProductProvider>(context).printprod();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
      ),
      body: SafeArea(
          child: ListView.builder(
              itemCount: allProducts.length,
              itemBuilder: ((context, index) {
                return GestureDetector(
                  onTap: () => Navigator.of(context).pushNamed(
                      BarcodeProd.routName,
                      arguments: {'data': allProducts[index]['productUid']}),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Dismissible(
                        direction: DismissDirection.endToStart,
                        onDismissed: (direction) {
                          if (direction == DismissDirection.endToStart) {
                            AuthMethod()
                                .deletedById(allProducts[index]['productUid']);
                            showsnackbar(
                                context: context,
                                content:
                                    '${allProducts[index]['productName']} deleted');
                          }
                        },
                        key: const ValueKey('gg'),
                        child: ListTile(
                          tileColor: primaryColor,
                          textColor: mobileBackgroundColor,
                          title: Column(children: [
                            const Text(
                              'product name',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: screensize.height * 0.02,
                            ),
                            Text(allProducts[index]['productName']),
                          ]),
                          leading: Column(
                            children: [
                              const Text(
                                'product quantity',
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: screensize.height * 0.02,
                              ),
                              Text(allProducts[index]['productQantity'])
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }))),
    );
  }
}
