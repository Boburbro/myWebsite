import 'package:flutter/widgets.dart';
import 'package:portfolio/screens/pixels/desktop.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return const DesktopScreen(
        child: Column(
      children: [Text("data")],
    ));
  }
}
