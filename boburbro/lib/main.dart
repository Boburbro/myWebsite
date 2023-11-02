import 'package:boburbro/models/model.dart';
import 'package:boburbro/widget/background.dart';
import 'package:boburbro/widget/saytItem.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: GoogleFonts.aBeeZee().fontFamily),
      debugShowCheckedModeBanner: false,
      home: MyCustomWidget(),
    );
  }
}

class MyCustomWidget extends StatelessWidget {
  final saytlar = Saytlar().list;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.red,
      body: Stack(
        children: [
          const Background(),
          saytItem(saytlar: saytlar),
        
        ],
      ),
    );
  }
}
