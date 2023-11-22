import 'package:adminapp/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      },
    );
  }
}
