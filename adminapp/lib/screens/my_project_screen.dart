import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../models/urls.dart';

import '../widgets/add_modal_bottom.dart';
import '../widgets/my_project_screen_body.dart';

class MyProjectScreen extends StatefulWidget {
  const MyProjectScreen({super.key});

  static const routeName = "/my-project-screen";

  @override
  State<MyProjectScreen> createState() => _MyProjectScreenState();
}

class _MyProjectScreenState extends State<MyProjectScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController urlController = TextEditingController();

  List data = [];

  getData() async {
    setState(() {
      data = [];
    });
    Response response = await get(Urls().getUrl);
    setState(() {
      data = jsonDecode(response.body);
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  void _save() {
    if (nameController.text.isNotEmpty &&
        descriptionController.text.isNotEmpty &&
        urlController.text.isNotEmpty) {
      Navigator.of(context).pop();
      addNewData(
          nameController.text, descriptionController.text, urlController.text);

      // add to base
    }
  }

  addNewData(String title, String dec, String link) async {
    setState(() {
      data = [];
    });
    Response response = await post(
      Urls().addUrls,
      headers: {'Content-Type': 'application/json'},
      body: json.encode(
        {
          'title': title,
          'subtitle': dec,
          'link': link,
        },
      ),
    );
    if (response.statusCode == 200) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Saqlandi")));
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Xatolig: ${response.statusCode}")));
    }
    setState(() {
      getData();
    });
  }

  void _showModalShit(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) {
        return AddModalBottom(
          nameController: nameController,
          descriptionController: descriptionController,
          urlController: urlController,
          save: _save,
        );
      },
    );
  }

  void deleteProject(int id) async {
    setState(() {
      data = [];
    });
    Response response = await post(
      Urls().deleteUrl,
      headers: {'Content-Type': 'application/json'},
      body: json.encode(
        {
          'rId': id,
        },
      ),
    );
    if (response.statusCode == 200) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Bajarildi")));
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Xatolig: ${response.statusCode}")));
    }
    setState(() {
      getData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Project"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                getData();
              },
              icon: const Icon(Icons.refresh_rounded)),
          Container(width: 10)
        ],
      ),
      // ignore: prefer_is_empty
      body: data.length != 0
          ? MyProjectBody(
              data: data,
              deleteProject: deleteProject,
            )
          : const Center(
              child: Text(
                "Xozircha xech narsa yo'q",
                style: TextStyle(fontSize: 20),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showModalShit(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}
