import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import '../screens/home.dart';
import '../screens/my_admin_coures_screen.dart';
import '../screens/my_project_screen.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lime,
        fontFamily: GoogleFonts.raleway(fontWeight: FontWeight.w500).fontFamily,
      ),
      initialRoute: "/",
      routes: {
        Home.routeName: (context) => Home(),
        MyProjectScreen.routeName: (context) => const MyProjectScreen(),
        MyAdminCourseScreen.routeName: (context) => const MyAdminCourseScreen(),
      },
    );
  }
}
