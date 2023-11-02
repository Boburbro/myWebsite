import 'package:boburbro/models/model.dart';
import 'package:flutter/material.dart';

import 'dart:html' as html;

class saytItem extends StatelessWidget {
  const saytItem({
    super.key,
    required this.saytlar,
  });

  final List<Sayt> saytlar;

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    double n = _width < 600 || _height < 800 ? 0.7 : 1.0;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
            Center(
              child: Column(
            
                children: [
                  Container(
                    
                    width: 500 * n,
                    height: 30,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      color: Colors.white,
                    ),
                    child: const Center(
                      child: Text(
                        "Portfolio uchun qilingan barcha applar",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Container(
                    clipBehavior: Clip.hardEdge,
                    padding: EdgeInsets.zero,
                    width: 500 * n,
                    height: 700 * n,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                      color: Colors.white,
                    ),
                    child: ListView.builder(
                        itemCount: saytlar.length,
                        itemBuilder: (ctx, index) {
                          return ListTile(
                            leading: const Icon(Icons.flutter_dash),
                            title: Text(saytlar[index].title),
                            subtitle: Text(saytlar[index].subtitle),
                            trailing: IconButton(
                              onPressed: () {
                                html.window.open(saytlar[index].url, "_self");
                              },
                              icon: const Icon(Icons.login),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
         
        TextButton.icon(
          onPressed: () {
            html.window.open("https://t.me/ITwithBobur", "_self");
          },
          icon: const Icon(Icons.telegram),
          label: const Text("Telegram"),
        )
      ],
    );
  }
}
