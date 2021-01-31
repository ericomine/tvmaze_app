import 'package:flutter/material.dart';

class RhomboidClipper extends CustomClipper<Path> {
  final double clipHeight;
  final bool cutTop;
  final bool cutBottom;

  RhomboidClipper({
    this.cutTop = true,
    this.cutBottom = true,
    this.clipHeight = 20,
  });

  @override
  Path getClip(Size size) {
    final w = size.width;
    final h = size.height;
    final path = Path();
    path.lineTo(0.0, cutTop ? clipHeight : 0.0);
    path.lineTo(0.0, h);
    path.lineTo(w, cutBottom ? h - clipHeight : h);
    path.lineTo(w, 0.0);
    path.lineTo(0.0, cutTop ? clipHeight : 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
