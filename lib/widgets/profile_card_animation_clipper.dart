import 'dart:math';

import 'package:flutter/material.dart';

class ProfileCardAnimationClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();
    path.moveTo(0, size.height / 2);
    path.arcTo(
        Rect.fromCenter(
            center: Offset(size.width / 2, size.height / 2),
            width: size.width,
            height: size.height),
        0,
        pi,
        true);
    path.lineTo(0, -1000);
    path.lineTo(size.width, -1000);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
