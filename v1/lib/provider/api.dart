import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class APIHelper with ChangeNotifier {
  Map<String, dynamic> users = {
    "name": "",
    "surname": "",
    "motto": "",
    "img": "",
    "skills": []
  };

  List<dynamic> projects = [];
  List<dynamic> skills = [];
  List<dynamic> simpleSkills = [];
  List<dynamic> contacts = [];

  Future<void> getUser() async {
    Uri url = Uri.parse("https://boburbro.pythonanywhere.com/v1/api/get-user");
    final r = await http.get(url);
    final data = jsonDecode(r.body);

    users['name'] = data['name'];
    users['surname'] = data['surname'];
    users['motto'] = data['motto'];
    users['img'] = data['img'];

    Uri url1 =
        Uri.parse("https://boburbro.pythonanywhere.com/v1/api/get-skills");
    final r1 = await http.get(url1);
    final data1 = jsonDecode(r1.body);
    var data2 = [];
    for (var element in data1) {
      data2.add(element[1]);
    }
    users['skills'] = data2;
  }

  Future<void> getSkills() async {
    Uri url =
        Uri.parse("https://boburbro.pythonanywhere.com/v1/api/get-skills");
    final r = await http.get(url);
    final data = jsonDecode(r.body);
    skills = data;

    Uri url1 = Uri.parse(
        "https://boburbro.pythonanywhere.com/v1/api/get-simple-skills");
    final r1 = await http.get(url1);
    final data1 = jsonDecode(r1.body);
    simpleSkills = data1;
  }

  Future<void> getProjects() async {
    Uri url =
        Uri.parse("https://boburbro.pythonanywhere.com/v1/api/get-project");
    final r = await http.get(url);
    final data = jsonDecode(r.body);
    projects = data;
  }

  Future<void> getContactLinks() async {
    Uri url =
        Uri.parse("https://boburbro.pythonanywhere.com/v1/api/get-contact");
    final r = await http.get(url);
    final data = jsonDecode(r.body);
    contacts = data;
  }

  Future<void> getAdmin() async {
    // /v1/api/get-user
    // /v1/api/update-user
    // /v1/api/get-project
    // /v1/api/add-project
    // /v1/api/update-project
    // /v1/api/get-skills
    // /v1/api/add-skills
    // /v1/api/update-skills
    // /v1/api/get-simple-skills
    // /v1/api/add-simple-skills
    // /v1/api/update-simple-skills
    // /v1/api/get-contact
    // /v1/api/add-contact
    // /v1/api/update-contact

    Uri getUserApi =
        Uri.parse("https://boburbro.pythonanywhere.com/v1/api/get-user");
  }
}
