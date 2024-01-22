import 'package:flutter/material.dart';
import '/screens/admin/admin.dart';

// ignore: must_be_immutable
class AdminLockScreen extends StatelessWidget {
  AdminLockScreen({super.key});

  static const routeName = "/admin-lock-screen";

  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  void submit(BuildContext context) {
    if (username.text.isEmpty || password.text.isEmpty) {
      Navigator.of(context).pushReplacementNamed("/");
      return;
    }
    if (username.text == "Boburbro" || password.text == "f1") {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => const Admin()));
      return;
    }
    Navigator.of(context).pushReplacementNamed("/");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ADMIN LOCK SCREEN"),
        centerTitle: true,
        actions: [
          TextButton.icon(
            onPressed: () => Navigator.of(context).pushReplacementNamed("/"),
            icon: const Icon(Icons.home_rounded),
            label: const Text("HOME"),
          ),
        ],
      ),
      body: Center(
        child: SizedBox(
          width: 400,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
               TextField(
                decoration: const InputDecoration(border: OutlineInputBorder()),
              controller: username,
              ),
              const SizedBox(height: 50),
               TextField(
                decoration:const InputDecoration(border: OutlineInputBorder()),
                obscureText: true,
                controller: password,
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                  onPressed: () => submit(context), child: const Text("ENTER"))
            ],
          ),
        ),
      ),
    );
  }
}
