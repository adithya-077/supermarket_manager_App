import 'package:flutter/material.dart';
import 'package:flutter_application_instagram_clone/provider/product_provider.dart';
import 'package:flutter_application_instagram_clone/provider/user_provider.dart';
import 'package:provider/provider.dart';

import './dimension.dart';

class ResponsiveLayout extends StatefulWidget {
  final Widget webScreen;
  final Widget mobileScreen;
  const ResponsiveLayout(
      {required this.mobileScreen, required this.webScreen, Key? key})
      : super(key: key);

  @override
  State<ResponsiveLayout> createState() => _ResponsiveLayoutState();
}

class _ResponsiveLayoutState extends State<ResponsiveLayout> {
  addData() async {
    UserdataProvider _userProvider =
        Provider.of<UserdataProvider>(context, listen: false);
    await _userProvider.refreshUserdata();

    ProductProvider _prod =
        Provider.of<ProductProvider>(context, listen: false);
    await _prod.updateProducts();
  }

  @override
  void initState() {
    super.initState();
    addData();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > webScreenSize) {
          // return webscreen
          return widget.mobileScreen;
        }
        return widget.webScreen;
      },
    );
  }
}
