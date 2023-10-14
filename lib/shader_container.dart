import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shader_space/app_constants.dart';
import 'package:shader_space/shader_painter.dart';

class ShaderContainer extends StatefulWidget {
  const ShaderContainer({
    super.key,
    required this.pageNumber,
  });

  final int pageNumber;

  @override
  State<ShaderContainer> createState() => _ShaderContainerState();
}

class _ShaderContainerState extends State<ShaderContainer> {
  late Timer timer;
  double delta = 0;
  double intensity = 0.5;
  FragmentShader? shader;

  void loadShader() async {
    var program = await FragmentProgram.fromAsset(
      'shaders/${widget.pageNumber}.frag',
    );
    shader = program.fragmentShader();
  }

  void startTimer() {
    timer = Timer.periodic(
      const Duration(milliseconds: 16),
      (timer) {
        setState(() {
          delta += 0.01;
        });
      },
    );
  }

  @override
  void didUpdateWidget(covariant ShaderContainer oldWidget) {
    if (oldWidget.pageNumber != widget.pageNumber) {
      loadShader();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    super.initState();
    startTimer();
    loadShader();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (shader == null) {
      return const Center(child: CircularProgressIndicator());
    } else {
      return Stack(
        children: [
          Positioned.fill(
            child: CustomPaint(
              painter: ShaderPainter(
                shader!,
                delta,
                intensity,
              ),
            ),
          ),
          Positioned(
            bottom: AppConstants.spacingMedium,
            left: AppConstants.spacingMedium,
            right: AppConstants.spacingMedium,
            child: Slider(
              value: intensity,
              onChanged: (value) {
                setState(() {
                  intensity = value;
                });
              },
            ),
          ),
        ],
      );
    }
  }
}
