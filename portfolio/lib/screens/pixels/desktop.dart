import 'package:flutter/widgets.dart';

class DesktopScreen extends StatelessWidget {
  const DesktopScreen({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1224,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: child,
    );
  }
}
