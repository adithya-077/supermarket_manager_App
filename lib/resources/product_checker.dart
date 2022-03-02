import 'package:flutter/cupertino.dart';
import 'package:flutter_application_instagram_clone/resources/auth_method.dart';
import 'package:flutter_application_instagram_clone/util/showSnackBar.dart';

Future<String> prochecker({
  required String productName,
  required String productUid,
  required String productQantity,
  required BuildContext context,
}) async {
  String isAdded = 'some error';
  if (productName.isNotEmpty ||
      productUid.isNotEmpty ||
      productQantity.isNotEmpty) {
    String res = await AuthMethod().addproducts(
        productName: productName,
        productUid: productUid,
        productQuantity: productQantity);
    isAdded = 'done';
    if (res != 'done') {
      showsnackbar(context: context, content: res);
    }
  }
  return isAdded;
}
