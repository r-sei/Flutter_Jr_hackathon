import 'package:flutter/material.dart';

class CustomShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double height = size.height;
    double width = size.width;
    double margin = 20;
    double curve = 25;
    double tab = width - 75;
    Path path = Path();
    path.lineTo(0, height);
    path.quadraticBezierTo(0, height - curve, curve, height - curve);
    path.lineTo(tab - curve, height - curve);
    path.quadraticBezierTo(tab, height - curve, tab, height - 2 * curve);
    path.lineTo(tab, curve + margin);
    path.quadraticBezierTo(tab, margin, tab + curve, margin);
    path.lineTo(width - curve, margin);
    path.quadraticBezierTo(width, margin, width, curve + margin);
    path.lineTo(width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class CustomShape2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double height = size.height;
    double width = size.width;
    double margin = 20;
    double curve = 25;
    double tab = width - 75;
    Path path = Path();
    path.lineTo(0, margin);
    path.lineTo(tab - curve + 1, margin);
    path.quadraticBezierTo(tab + 1, margin, tab + 1, margin + curve);
    path.lineTo(tab + 1, height - 2*curve);
    path.quadraticBezierTo(
        tab + 1, height - curve, tab + 1 + curve, height - curve);
    path.lineTo(width - curve, height - curve);
    path.quadraticBezierTo(width, height - curve, width, height - 2 * curve);
    path.lineTo(width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class BoxShadowPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    double height = size.height;
    double width = size.width;
    double margin = 20;
    double curve = 25;
    double tab = width - 75;
    path.lineTo(0, height);
    path.quadraticBezierTo(0, height - curve, curve, height - curve);
    path.lineTo(tab - curve, height - curve);
    path.quadraticBezierTo(tab, height - curve, tab, height - 2 * curve);
    path.lineTo(tab, curve + margin);
    path.quadraticBezierTo(tab, margin, tab + curve, margin);
    path.lineTo(width - curve, margin);
    path.quadraticBezierTo(width, margin, width, curve + margin);
    path.lineTo(width, 0);
    path.close();
    path.moveTo(size.width, size.height * 0.14);

    canvas.drawShadow(path, Colors.black, 3, false);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class BoxShadowPainter2 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    double height = size.height;
    double width = size.width;
    double margin = 20;
    double curve = 25;
    double tab = width - 75;
    path.lineTo(0, margin);
    path.lineTo(tab - curve + 1, margin);
    path.quadraticBezierTo(tab + 1, margin, tab + 1, margin + curve);
    path.lineTo(tab + 1, height - 2*curve);
    path.quadraticBezierTo(
        tab + 1, height - curve, tab + 1 + curve, height - curve);
    path.lineTo(width - curve, height - curve);
    path.quadraticBezierTo(width, height - curve, width, height - 2 * curve);
    path.lineTo(width, 0);
    path.close();
    path.moveTo(size.width, size.height * 0.14);

    canvas.drawShadow(path, Colors.black, 3, false);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}