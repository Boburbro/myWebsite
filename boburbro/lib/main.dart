import 'package:boburbro/model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:particles_flutter/particles_flutter.dart';

import 'dart:html' as html;

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: GoogleFonts.aBeeZee().fontFamily
      ),
      debugShowCheckedModeBanner: false,
      home: MyCustomWidget(),
    );
  }
}

class MyCustomWidget extends StatelessWidget {
  final saytlar = Saytlar().list;

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.red,
      body: Stack(
        children: [
          CircularParticle(
            width: w,
            height: h,
            awayRadius: w / 5,
            numberOfParticles: 150,
            speedOfParticles: 1.5,
            maxParticleSize: 7,
            particleColor: Colors.white.withOpacity(.7),
            awayAnimationDuration: Duration(milliseconds: 600),
            awayAnimationCurve: Curves.easeInOutBack,
            onTapAnimation: true,
            isRandSize: true,
            isRandomColor: false,
            connectDots: true,
            enableHover: true,
            hoverColor: Colors.black,
            hoverRadius: 90,
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 500,
                    height: 700,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: ListView.builder(
                        itemCount: saytlar.length,
                        itemBuilder: (ctx, index) {
                          return ListTile(
                            leading: Icon(Icons.flutter_dash),
                            title: Text(saytlar[index].title),
                            subtitle: Text(saytlar[index].subtitle),
                            trailing: IconButton(
                              onPressed: () {
                                html.window.open(saytlar[index].url, "_self");
                              },
                              icon: Icon(Icons.login),
                            ),
                          );
                        }),
                  ),
                ],
              ),
              TextButton.icon(
                onPressed: () {
                                html.window.open("https://t.me/ITwithBobur", "_self");

                },
                icon: Icon(Icons.telegram),
                label: Text("Telegram"),
              )
            ],
          ),

          // Expanded(
          //   child: ListView.builder(
          //       itemCount: sities.length,
          //       itemBuilder: (ctx, index) {
          //         return Container(
          //           decoration: BoxDecoration(
          //               borderRadius: BorderRadius.circular(20),
          //               color: Colors.white),
          //           child: Container(
          //             padding: EdgeInsets.all(10),
          //             child: ListTile(
          //               leading: Icon(Icons.flutter_dash),
          //               title: Text("${sities[index]['title']}"),
          //               subtitle: Text("${sities[index]['subtitle']}"),
          //               trailing: IconButton(
          //                 onPressed: () {
          //                   html.window.open("https://github.com", "_self");
          //                 },
          //                 icon: Icon(Icons.paste_sharp),
          //               ),
          //             ),
          //           ),
          //         );
          //       }),
          // )
        ],
      ),
    );
  }
}
