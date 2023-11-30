import 'package:adminapp/screens/my_admin_coures_screen.dart';
import 'package:flutter/material.dart';

import '../widgets/main_page_item.dart';

import '../screens/my_project_screen.dart';

// ignore: must_be_immutable
class MainPage extends StatelessWidget {
  MainPage({super.key});

  // ignore: non_constant_identifier_names
  List items_title = [
    {
      "id": const MyProjectScreen(),
      "title": "My projects",
    },
    {
      "id": const MyAdminCourseScreen(),
      "title": "Admin course",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Admin dashboard"),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(15),
        itemCount: items_title.length,
        itemBuilder: (ctx, index) {
          return MainPageItem(
            title: items_title[index]["title"],
            page: items_title[index]["id"],
          );
        },
      ),
    );
  }
}
