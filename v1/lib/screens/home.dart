import 'package:flutter/material.dart';
import 'package:v1/screens/desktop/home.dart';
import 'package:v1/screens/mobile/mobile_screen.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    double appWidth = MediaQuery.of(context).size.width;
    return appWidth >= 1224 ? const DesktopHome() : const MobileScreen();
  }
}
