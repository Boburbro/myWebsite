
import 'package:flutter/material.dart';
import 'package:particles_flutter/particles_flutter.dart';

import 'dart:html' as html;

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyCustomWidget(),
    );
  }
}

class MyCustomWidget extends StatelessWidget {
  List<Map<String, String>> sities = [
    {"title": "Modul 1", "subtitle": "Quiz app", "url": ""},
    {"title": "Modul 2", "subtitle": "USER List app","url": ""},
  ];

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.red,
      body: Stack(children: [
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
        SafeArea(
            child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: sities.length,
                  itemBuilder: (ctx, index) {
                    return ListTile(
                      leading: Icon(Icons.flutter_dash),
                      title: Text("${sities[index]['title']}"),
                      subtitle: Text("${sities[index]['subtitle']}"),
                      trailing: IconButton(onPressed: (){
                        // json.context.callMethod('open', ['httsp://github.com']);
                        // js.context.callMethod('open', ['https://stackoverflow.com/questions/ask']);
                        html.window.open("httsp://github.com", "_blank");
                      }, icon: Icon(Icons.paste_sharp),),
                    );
                  }),
            )
          ],
        ))
      ]),
    );
  }
}
