import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import './screens/admin/admin.dart';
import './screens/admin/lock_screen.dart';
import '/provider/api.dart';
import '/screens/desktop/project_screen.dart';
import '/screens/desktop/contact.dart';
import '/screens/desktop/skills.dart';

import '/screens/home.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => APIHelper(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "My portfolio",
        theme: ThemeData(
          fontFamily: GoogleFonts.inconsolata().fontFamily,
        ),
        home: const Home(),
        // home: const Admin(),
        routes: {
          // Home.routeName: (context) => const Home(),
          ProjectScreen.routeName: (context) => const ProjectScreen(),
          ContactMe.routeName: (context) => const ContactMe(),
          Skills.routeName: (context) => const Skills(),
          AdminLockScreen.routeName: (context) => AdminLockScreen(),
        },
      ),
    );
  }
}
