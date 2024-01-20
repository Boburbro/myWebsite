import 'package:flutter/material.dart';

import '/screens/mobile/home.dart';
import '/screens/table/home.dart';
import '/screens/desktop/home.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  static const routeName = "/";

  @override
  Widget build(BuildContext context) {
    double appWidth = MediaQuery.of(context).size.width;
    return appWidth >= 1224
        ? const DesktopHome()
        : appWidth >= 900
            ? const TableHome()
            : const MobileHome();
  }
}
