import 'package:flutter/material.dart';

class RhomboidClipper extends CustomClipper<Path> {
  final double clipPercentage;
  final bool cutTop;
  final bool cutBottom;

  RhomboidClipper({
    this.cutTop = true,
    this.cutBottom = true,
    this.clipPercentage = 0.05,
  });

  @override
  Path getClip(Size size) {
    final w = size.width;
    final h = size.height;
    final path = Path();
    path.lineTo(0.0, cutTop ? clipPercentage * h : 0.0);
    path.lineTo(0.0, h);
    path.lineTo(w, cutBottom ? (1.0 - clipPercentage) * h : h);
    path.lineTo(w, 0.0);
    path.lineTo(0.0, cutTop ? clipPercentage * h : 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
