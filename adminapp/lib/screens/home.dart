// ignore_for_file: must_be_immutable

import 'package:adminapp/screens/main_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  static const routeName = "/";

  Home({super.key});

  // ignore: prefer_final_fields
  TextEditingController _controller = TextEditingController();

  void submit(BuildContext context) {
    if (_controller.text.isEmpty) {
      ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Siz hali parol kiritmadingiz")));
      return;
    } else {
      if (_controller.text == "1234") {
        Navigator.of(context)
            .push(CupertinoPageRoute(builder: (ctx) => const MainPage()));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Parol xato!")));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign in"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset("assets/logo.jpg", fit: BoxFit.cover),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _controller,
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Iltimos parolni kiriting!"),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "ILOVADAN CHIQISH",
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        submit(context);
                      },
                      child: const Text("KIRISH")),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
