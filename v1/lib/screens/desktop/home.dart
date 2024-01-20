import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:provider/provider.dart';

import '/provider/api.dart';

import './contact.dart';
import './desktop.dart';
import './project_screen.dart';
import './skills.dart';

class DesktopHome extends StatefulWidget {
  const DesktopHome({super.key});

  @override
  State<DesktopHome> createState() => _DesktopHomeState();
}

class _DesktopHomeState extends State<DesktopHome> {
  late Map data;
  List userSkills = [];
  bool isLoading = false;

  @override
  void initState() {
    setState(() {
      isLoading = true;
    });

    Provider.of<APIHelper>(context, listen: false).getUser().then((value) {
      data = Provider.of<APIHelper>(context, listen: false).users;
      userSkills = data['skills'];
    }).then((value) => setState(() {
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
          : DesktopScreen(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 12),
                  AppBar(
                    title: Text(
                      "${data['name']}'s portfoli",
                      style: const TextStyle(fontSize: 24),
                    ),
                    actions: [
                      TextButton(
                          onPressed: () =>
                              Navigator.of(context).push(CupertinoPageRoute(
                                builder: (_) => const ProjectScreen(),
                              )),
                          child: const Text("Projects")),
                      TextButton(
                          onPressed: () =>
                              Navigator.of(context).push(CupertinoPageRoute(
                                builder: (_) => const Skills(),
                              )),
                          child: const Text("Skills")),
                      TextButton(
                          onPressed: () =>
                              Navigator.of(context).push(CupertinoPageRoute(
                                builder: (_) => const ContactMe(),
                              )),
                          child: const Text("Contacts")),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 64,
                                fontFamily:
                                    GoogleFonts.inconsolata().fontFamily),
                            children: [
                              const TextSpan(text: "Hi, I'm "),
                              TextSpan(
                                text: "${data['name']} ${data['surname']}",
                                style: const TextStyle(
                                  color: Color.fromRGBO(41, 120, 181, 1.0),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Image.asset("assets/img1.png"),
                      const SizedBox(width: 100),
                      Column(
                        children: [
                          SizedBox(
                            width: 600,
                            child: AnimatedTextKit(
                              animatedTexts: userSkills
                                  .map((e) => TyperAnimatedText(
                                        "I am a $e developer",
                                        speed:
                                            const Duration(milliseconds: 150),
                                        textStyle: const TextStyle(
                                          fontSize: 35,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ))
                                  .toList(),
                              isRepeatingAnimation: true,
                              repeatForever: true,
                              displayFullTextOnTap: true,
                              stopPauseOnTap: false,
                            ),
                          ),
                          Text(data['motto'])
                        ],
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ],
              ),
            ),
    );
  }
}
