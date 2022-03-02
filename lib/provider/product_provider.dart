import 'package:flutter/cupertino.dart';
import 'package:flutter_application_instagram_clone/resources/auth_method.dart';

class ProductProvider with ChangeNotifier {
  late List<dynamic> productAll;

  List get getProducts => [...productAll];

  void printprod() {
    // ignore: avoid_print
    print(productAll);
  }

  Future<void> updateProducts() async {
    List<dynamic> products = await AuthMethod().getAllProducts();

    productAll = products;
    notifyListeners();
    // ignore: avoid_print
    print(productAll);
  }
}
