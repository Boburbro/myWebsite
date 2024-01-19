import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:v1/screens/desktop/desktop.dart';

class ProjectScreen extends StatelessWidget {
  const ProjectScreen({super.key});

  static const routeName = "/projects";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DesktopScreen(
        child: Column(
          children: [
            const SizedBox(height: 20),
            AppBar(
              title: const Text(
                "Projects",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              centerTitle: true,
            ),
            const SizedBox(height: 50),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(20),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                ),
                itemCount: 50,
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
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(32),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Text(
                              "MyBlog Project",
                              style: TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: GoogleFonts.aBeeZee().fontFamily),
                            ),
                            const Text(
                              "I write down the knowledge I have learned or am learning on this blog site. I used these technologies - Django Html, CSS, Bootstrap - to make this site. More than 20 people visit my site.",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 20),
                            ),
                            const SizedBox(height: 10),
                            const Text("Django HTML CSS Bootstrap"),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  onPressed: () {},
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
