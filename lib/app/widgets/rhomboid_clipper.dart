import 'package:flutter/material.dart';

class RhomboidClipper extends CustomClipper<Path> {
  final double clipPercentage;
  RhomboidClipper({this.clipPercentage = 0.05});

  @override
  Path getClip(Size size) {
    final w = size.width;
    final h = size.height;
    final path = Path();
    path.lineTo(0.0, clipPercentage * h);
    path.lineTo(0.0, h);
    path.lineTo(w, (1.0 - clipPercentage) * h);
    path.lineTo(w, 0.0);
    path.lineTo(0.00, clipPercentage * h);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
