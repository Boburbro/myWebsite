import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';

import '/provider/api.dart';
import 'table.dart';

class Skills extends StatefulWidget {
  const Skills({super.key});

  static const routeName = "/skills";

  @override
  State<Skills> createState() => _SkillsState();
}

class _SkillsState extends State<Skills> {
  List skills = [];
  List simpleSkills = [];
  var isLoading = false;

  @override
  void initState() {
    setState(() {
      isLoading = true;
    });
    Provider.of<APIHelper>(context, listen: false).getSkills().then((value) {
      setState(() {
        skills = Provider.of<APIHelper>(context, listen: false).skills;
        simpleSkills =
            Provider.of<APIHelper>(context, listen: false).simpleSkills;
        isLoading = false;
      });
    });
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
          : SingleChildScrollView(
              child: TableScreen(
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    AppBar(
                      title: const Text(
                        "Skills",
                        style: TextStyle(
                            fontSize: 32, fontWeight: FontWeight.bold),
                      ),
                      centerTitle: true,
                    ),
                    const SizedBox(height: 50),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: skills
                          .map((e) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: BuildLinearPercentIndicator(
                                    text: e[1], percent: double.parse(e[2])),
                              ))
                          .toList(),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: ((skills.length / 4) + 1) * 45,
                      width: 700,
                      child: GridView.builder(
                        padding: const EdgeInsets.all(20),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          mainAxisExtent: 30,
                        ),
                        itemCount: simpleSkills.length,
                        itemBuilder: (ctx, index) {
                          return Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.1),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: const Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ImageIcon(
                                  NetworkImage(simpleSkills[index][2]),
                                  size: 20,
                                ),
                                Text(simpleSkills[index][1]),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}

class BuildLinearPercentIndicator extends StatelessWidget {
  const BuildLinearPercentIndicator({
    required this.text,
    required this.percent,
    super.key,
  });

  final String text;
  final double percent;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "$text: ",
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        LinearPercentIndicator(
          width: 700,
          barRadius: const Radius.circular(20),
          animation: true,
          lineHeight: 20.0,
          animationDuration: 2500,
          percent: percent * 0.01,
          center: Text("$percent%"),
          progressColor: Colors.amber,
        ),
      ],
    );
  }
}
