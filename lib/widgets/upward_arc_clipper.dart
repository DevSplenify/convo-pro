import 'package:flutter/material.dart';

class UpwardArcClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    // Start from top-left corner
    path.lineTo(0, 0);

    // Line down left side
    path.lineTo(0, size.height);

    // Make the arc more inward (deeper)
    final controlPoint = Offset(size.width / 2, size.height - 100);
    final endPoint = Offset(size.width, size.height);

    path.quadraticBezierTo(
      controlPoint.dx,
      controlPoint.dy,
      endPoint.dx,
      endPoint.dy,
    );

    // Close the path at the top
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
