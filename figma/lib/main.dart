import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Container(
      width: 1920,
      height: 1022,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(color: Color(0xFFD7D7D7)),
      child: Stack(
        children: [
          Positioned(
            left: 256,
            top: 351,
            child: SizedBox(
              width: 171,
              height: 58,
              child: Text(
                'Hi, I am',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 40,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
            ),
          ),
          Positioned(
            left: 271,
            top: 463,
            child: SizedBox(
              width: 532,
              height: 105,
              child: Text(
                'Tomasz Gajda',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 80,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
            ),
          ),
          Positioned(
            left: 271,
            top: 560,
            child: SizedBox(
              width: 426,
              height: 40,
              child: Text(
                'Front-end Developer / UI Designer',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF909090),
                  fontSize: 25,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w800,
                  height: 0,
                ),
              ),
            ),
          ),
          Positioned(
            left: 322,
            top: 737.20,
            child: Container(
              width: 37,
              height: 37,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(),
            ),
          ),
          Positioned(
            left: 271,
            top: 726,
            child: Container(
              width: 61,
              height: 56,
              decoration: BoxDecoration(
                color: Color(0xFFC4C4C4),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 4,
                    offset: Offset(0, 4),
                    spreadRadius: 0,
                  )
                ],
              ),
            ),
          ),
          Positioned(
            left: 455,
            top: 726,
            child: Container(
              width: 61,
              height: 56,
              decoration: BoxDecoration(
                color: Color(0xFFC4C4C4),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 4,
                    offset: Offset(0, 4),
                    spreadRadius: 0,
                  )
                ],
              ),
            ),
          ),
          Positioned(
            left: 363,
            top: 726,
            child: Container(
              width: 61,
              height: 56,
              decoration: BoxDecoration(
                color: Color(0xFFC4C4C4),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 4,
                    offset: Offset(0, 4),
                    spreadRadius: 0,
                  )
                ],
              ),
            ),
          ),
          Positioned(
            left: 860,
            top: 145,
            child: Container(
              width: 783,
              height: 877,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage("https://via.placeholder.com/783x877"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Positioned(
            left: 1191,
            top: 956,
            child: SizedBox(
              width: 136,
              height: 60,
              child: Text(
                'this is not my photo, but I dearly hope to get one just like this ',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ),
          ),
          Positioned(
            left: 272,
            top: 72,
            child: Container(
              width: 59.67,
              height: 50,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(),
              child: Stack(
                children: [
                  Positioned(
                    left: 1.24,
                    top: -0,
                    child: Container(
                      width: 57.33,
                      height: 50,
                      child: Stack(children: []),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
