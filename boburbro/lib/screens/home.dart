import 'package:boburbro/widget/background.dart';
import 'package:flutter/material.dart';

import '../widget/saytItem.dart';

class Home extends StatelessWidget {
  static const routeName = "/";

  Home({super.key});


  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.red,
      body: Stack(
        children: [
          Background(),
          // Image.network(
          //   "https://images.pexels.com/photos/963278/pexels-photo-963278.jpeg?auto=compress&cs=tinysrgb&w=1600",
          //   fit: BoxFit.cover,
          //   width: double.infinity,
          //   height: double.infinity,
          // ),
          // Column(
          //   children: [
          //     SizedBox(
          //       width: double.infinity,
          //       height: 50,
          //       child: Marquee(
          //         showFadingOnlyWhenScrolling: false,
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         text:
          //             'Telegram kanal: @ITwithBobur Instagram: @Boburbro_ YouTube: @Bobubro Telegram: @Boburbross ',
          //         style: const TextStyle(
          //             fontSize: 30, backgroundColor: Colors.white),
          //         blankSpace: 0,
          //       ),
          //     ),
          //     Card(
          //       child: ListTile(
          //         onTap: () {
          //           Navigator.of(context).pushReplacement(
          //               CupertinoPageRoute(builder: (_) => MyProjectsList()));
          //         },
          //         title: const Text(
          //             "Ustoz bilin qilingan projectlar qilinga projectlar"),
          //       ),
          //     )
          //   ],
          // ),
          saytItem(),
        ],
      ),
    );
  }
}
