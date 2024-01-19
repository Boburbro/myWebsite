import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:v1/screens/desktop/contact.dart';
import 'package:v1/screens/desktop/desktop.dart';
import 'package:v1/screens/desktop/project_screen.dart';
import 'package:v1/screens/desktop/skills.dart';

class DesktopHome extends StatelessWidget {
  const DesktopHome({super.key});

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DesktopScreen(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),
            AppBar(
              title: const Text(
                "Bobur's portfoli",
                style: TextStyle(fontSize: 24),
              ),
              actions: [
                ElevatedButton(
                    onPressed: () {
                    },
                    child: const Text("PRESS")),
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
                          builder: (_) => ContactMe(),
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
                          fontFamily: GoogleFonts.inconsolata().fontFamily),
                      children: const [
                        TextSpan(text: "Hi, I'm "),
                        TextSpan(
                          text: "Bobur Otaboyev",
                          style: TextStyle(
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
                        animatedTexts: [
                          TyperAnimatedText(
                            "I am a Mobile developer",
                            speed: const Duration(milliseconds: 150),
                            textStyle: const TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TyperAnimatedText(
                            "I am a Flutter developer",
                            speed: const Duration(milliseconds: 150),
                            textStyle: const TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TyperAnimatedText(
                            "I am a BackEnd developer",
                            speed: const Duration(milliseconds: 150),
                            textStyle: const TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TyperAnimatedText(
                            "I am a Telegram Bot developer",
                            speed: const Duration(milliseconds: 150),
                            textStyle: const TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                        isRepeatingAnimation: true,
                        repeatForever: true,
                        displayFullTextOnTap: true,
                        stopPauseOnTap: false,
                      ),
                    ),
                    const Text("btw I use Arch")
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
