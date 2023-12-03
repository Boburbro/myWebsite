import 'package:flutter/material.dart';

import '/widget/background.dart';
import '/widget/site_item_build.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.red,
      body: Stack(
        children: [
          Background(),
          ItemBuild(),
        ],
      ),
    );
  }
}
