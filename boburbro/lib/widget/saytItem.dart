// ignore_for_file: avoid_web_libraries_in_flutter, file_names, camel_case_types, no_leading_underscores_for_local_identifiers

// import 'dart:convert';
import 'package:boburbro/models/model.dart';
import 'package:flutter/material.dart';
// import 'package:http/http.dart';

// import 'dart:html' as html;

// import '../models/urls.dart';

class saytItem extends StatefulWidget {
  const saytItem({
    super.key,
  });

  @override
  State<saytItem> createState() => _saytItemState();
}

class _saytItemState extends State<saytItem> {
  final Saytlar sayt = Saytlar();
  List data = [];

  getData() async {
    setState(() {
      data = [];
    });
    // Response response = await get(Urls().getUrl);
    setState(() {
      // data = json.decode(response.body);
      data = sayt.list();
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
    print(data);
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    double n = _width < 600 || _height < 800 ? 0.7 : 1.0;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Card(
            child: Expanded(
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
                          // IconButton(
                          //   padding: EdgeInsets.zero,
                          //   onPressed: () {
                          //     Navigator.of(context).pushReplacement(
                          //         CupertinoPageRoute(builder: (_) => Home()));
                          //   },
                          //   icon: const Icon(
                          //     Icons.chevron_left_rounded,
                          //   ),
                          // ),
                          const Text(
                            "Portfolio uchun qilingan barcha applar",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextButton.icon(
                            onPressed: () {
                              getData();
                              // html.window
                              //     .open("https://t.me/ITwithBobur", "_self");
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
                        itemCount: 1,
                        itemBuilder: (ctx, index) {
                          return ListTile(
                            leading: const Icon(Icons.flutter_dash),
                            title: Text("dsdassdf $data"),
                            // subtitle: Text(saytlar[index].subtitle),
                            // trailing: IconButton(
                            //   onPressed: () {
                            //     html.window.open(saytlar[index].url, "_self");
                            //   },
                            //   icon: const Icon(Icons.login),
                            // ),
                          );
                        }),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
