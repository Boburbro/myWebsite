import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:v1/screens/desktop/contact.dart';
import 'package:v1/screens/desktop/project_screen.dart';
import 'package:v1/screens/desktop/skills.dart';

import 'screens/home.dart';

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
        fontFamily: GoogleFonts.inconsolata().fontFamily,
      ),
      home: const Home(),
      // initialRoute: Skills.routeName,
      routes: {
        ProjectScreen.routeName: (context) => const ProjectScreen(),
        ContactMe.routeName: (context) => ContactMe(),
        Skills.routeName: (context) => const Skills(),
      },
    );
  }
}
