import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:v1/screens/desktop/desktop.dart';

class Skills extends StatelessWidget {
  const Skills({super.key});

  static const routeName = "/skills";

  @override
  Widget build(BuildContext context) {
    int n = 10;
    return Scaffold(
      body: SingleChildScrollView(
        child: DesktopScreen(
          child: Column(
            children: [
              const SizedBox(height: 20),
              AppBar(
                title: const Text(
                  "Skills",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                centerTitle: true,
              ),
              const SizedBox(height: 50),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  BuildLinearPercentIndicator(text: "text", percent: 20),
                  SizedBox(height: 20),
                  BuildLinearPercentIndicator(
                      text: "sfbsgbsfsdvvvvvvvvvvsgf", percent: 20),
                  SizedBox(height: 20),
                  BuildLinearPercentIndicator(text: "sdfbsdfvbsd", percent: 20),
                  SizedBox(height: 20),
                  BuildLinearPercentIndicator(text: "dffdb", percent: 20),
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: ((n / 4) + 1) * 45,
                width: 700,
                child: GridView.builder(
                  padding: const EdgeInsets.all(20),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    mainAxisExtent: 30,
                  ),
                  itemCount: n,
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
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.abc),
                          Text("data"),
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
        Text("$text: "),
        LinearPercentIndicator(
          width: 1000,
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
