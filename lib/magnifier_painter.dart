import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class MagnifierPainter extends CustomPainter {
  final ui.Image image;
  final Offset offset;

  MagnifierPainter({required this.image, required this.offset});

  @override
  void paint(Canvas canvas, Size size) {
    final srcWidth = 100.0;
    final srcHeight = 100.0;

    final srcRect = Rect.fromLTWH(
      offset.dx - srcWidth / 2,
      offset.dy - srcHeight / 2,
      srcWidth,
      srcHeight,
    );
    final dstRect = Rect.fromLTWH(0, 0, size.width, size.height);

    canvas.drawImageRect(image, srcRect, dstRect, Paint());
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
