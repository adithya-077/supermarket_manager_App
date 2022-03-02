import 'package:flutter/material.dart';
import 'package:flutter_application_instagram_clone/models/product_models.dart';
import 'package:flutter_application_instagram_clone/provider/product_provider.dart';
import 'package:flutter_application_instagram_clone/util/colors.dart';
import 'package:provider/provider.dart';

class ShowProducts extends StatefulWidget {
  const ShowProducts({
    Key? key,
  }) : super(key: key);

  static String routName = 'show-all-products';
  @override
  _ShowProductsState createState() => _ShowProductsState();
}

class _ShowProductsState extends State<ShowProducts> {
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
                return Padding(
                  padding: const EdgeInsets.all(10),
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
                );
              }))),
    );
  }
}
