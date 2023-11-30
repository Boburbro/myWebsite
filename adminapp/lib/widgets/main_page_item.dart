import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainPageItem extends StatelessWidget {
  const MainPageItem({required this.title, required this.page, super.key});

  final String title;
  final Widget page;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () => Navigator.of(context).push(CupertinoPageRoute(builder: (build)=> page)),
        title: Text(title),
      ),
    );
  }
}
