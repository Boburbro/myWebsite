import 'package:flutter/material.dart';

class TableScreen extends StatelessWidget {
  const TableScreen({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 900,
          child: child,
        )
      ],
    );
  }
}
