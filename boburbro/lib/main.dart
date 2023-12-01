import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../screens/home.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: false,
        fontFamily: GoogleFonts.aBeeZee().fontFamily,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        Home.routeName: (context) =>  Home(),
      },
    );
  }
}
