import 'package:flutter/material.dart';

import './dimension.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget webScreen;
  final Widget mobileScreen;
  const ResponsiveLayout(
      {required this.mobileScreen, required this.webScreen, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > webScreenSize) {
          // return webscreen
          return mobileScreen;
        }
        return webScreen;
      },
    );
  }
}
