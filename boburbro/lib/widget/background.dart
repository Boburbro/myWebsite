import 'package:flutter/material.dart';

import 'package:particles_flutter/particles_flutter.dart';

class Background extends StatelessWidget {
  const Background({super.key});

  @override
  Widget build(BuildContext context) {
    return CircularParticle(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      awayRadius: MediaQuery.of(context).size.width / 5,
      numberOfParticles: 300,
      speedOfParticles: 2,
      maxParticleSize: 15,
      particleColor: Colors.white.withOpacity(.7),
      awayAnimationDuration: const Duration(milliseconds: 600),
      awayAnimationCurve: Curves.easeInOutBack,
      onTapAnimation: true,
      isRandSize: true,
      isRandomColor: false,
      connectDots: true,
      enableHover: true,
      hoverColor: Colors.black,
      hoverRadius: 90,
    );
  }
}
