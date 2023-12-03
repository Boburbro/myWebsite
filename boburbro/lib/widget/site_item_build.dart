import 'dart:convert';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

import 'package:http/http.dart';
import 'package:flutter/material.dart';

import '/api/apis.dart';

// ignore: must_be_immutable
class ItemBuild extends StatefulWidget {
  const ItemBuild({super.key});

  @override
  State<ItemBuild> createState() => _ItemBuildState();
}

class _ItemBuildState extends State<ItemBuild> {
  List<dynamic> data1 = [];

  getData() async {
    setState(() {
      data1 = [];
    });
    Response response = await get(GetData().getUrl, headers: {
      'Access-Control-Allow-Origin': '*',
      'Access-Control-Allow-Methods': 'GET, POST',
      'Access-Control-Allow-Headers': 'Content-Type'
    });
    setState(() {
      data1 = jsonDecode(response.body)['data'];
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    double n = width < 600 || height < 800 ? 0.7 : 1.0;
    return height > 630
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Card(
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
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                "Portfolio uchun qilingan barcha applar",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              width < 600 || height < 800
                                  ? IconButton(
                                      tooltip: 'Kanal',
                                      onPressed: () {
                                        html.window.open(
                                            "https://t.me/ITwithBobur",
                                            "_self");
                                      },
                                      icon: const Icon(Icons.telegram),
                                    )
                                  : TextButton.icon(
                                      onPressed: () {
                                        html.window.open(
                                            "https://t.me/ITwithBobur",
                                            "_self");
                                      },
                                      icon: const Icon(Icons.telegram),
                                      label: const Text("Kanal"),
                                    ),
                            ],
                          )),
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
                            itemCount: data1.length,
                            itemBuilder: (ctx, index) {
                              return ListTile(
                                leading: const Icon(Icons.android_outlined),
                                title: Text("${data1[index][1]}"),
                                subtitle: Text(
                                    "${data1[index][2]} \n\nLink: ${data1[index][3]}"),
                                trailing: IconButton(
                                    onPressed: () {
                                      html.window
                                          .open(data1[index][3], "_self");
                                    },
                                    icon: const Icon(Icons.login_rounded)),
                              );
                            }),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        : const Center(
            child: Text(
              "qurulma ekran judaham kich",
              style: TextStyle(backgroundColor: Colors.white),
            ),
          );
  }
}
