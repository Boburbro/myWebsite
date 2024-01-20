// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '/provider/api.dart';
import 'mobile_screen.dart';

class ProjectScreen extends StatefulWidget {
  const ProjectScreen({super.key});

  static const routeName = "/projects";

  @override
  State<ProjectScreen> createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen> {
  var isLoading = false;
  List projects = [];
  @override
  void initState() {
    setState(() {
      isLoading = true;
    });
    Provider.of<APIHelper>(context, listen: false)
        .getProjects()
        .then((value) => setState(() {
              projects =
                  Provider.of<APIHelper>(context, listen: false).projects;
              isLoading = false;
            }));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? const Center(
              child: CupertinoActivityIndicator(
                color: CupertinoColors.activeBlue,
                radius: 50,
              ),
            )
          : MobileScreen(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  AppBar(
                    title: const Text(
                      "Projects",
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                    centerTitle: true,
                  ),
                  const SizedBox(height: 50),
                  Expanded(
                    child: GridView.builder(
                      padding: const EdgeInsets.all(20),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 20,
                      ),
                      itemCount: projects.length,
                      itemBuilder: (ctx, index) {
                        return Container(
                          height: double.infinity,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: const Offset(
                                    0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(32),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Text(
                                    projects[index][1],
                                    style: TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                        fontFamily:
                                            GoogleFonts.aBeeZee().fontFamily),
                                  ),
                                  Text(
                                    projects[index][2],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(projects[index][3]),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      IconButton(
                                        onPressed: () => html.window
                                            .open(projects[index][4], '_blank'),
                                        icon: const Icon(
                                          Icons.open_in_new_rounded,
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
