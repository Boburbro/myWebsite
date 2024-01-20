import 'package:flutter/material.dart';

class MobileScreen extends StatelessWidget {
  const MobileScreen({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 500,
          child: child,
        )
      ],
    );
  }
}
