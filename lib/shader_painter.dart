import 'dart:ui';

import 'package:flutter/widgets.dart';

class ShaderPainter extends CustomPainter {
  final FragmentShader shader;
  final double time;
  final double intensity;

  ShaderPainter(
    FragmentShader fragmentShader,
    this.time,
    this.intensity,
  ) : shader = fragmentShader;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    shader.setFloat(0, size.width);
    shader.setFloat(1, size.height);
    shader.setFloat(2, time);
    shader.setFloat(3, intensity);
    paint.shader = shader;
    canvas.drawRect(Offset.zero & size, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
