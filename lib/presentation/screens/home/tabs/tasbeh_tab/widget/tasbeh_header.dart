import 'package:flutter/material.dart';
import 'dart:math';
import '../../../../../../core/assets_manager.dart';

class tasbehHeader extends StatelessWidget {
  tasbehHeader({super.key ,required this.controller ,required this.currentAngle});
  late AnimationController controller;
  double currentAngle  ;


  @override
  Widget build(BuildContext context) {
    return    Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 40.0 ),
          child: Center(
            child: SizedBox(
              height: 100,
              child: Image.asset(AssetsManager.sebhaHeaderImage),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 75.0),
          child: Center(
            child: SizedBox(
              height: 150,
              child: AnimatedBuilder(
                animation: controller,
                builder: (context, child) {
                  return Transform.rotate(
                    angle: currentAngle,
                    child: child,
                  );
                },
                child: Image.asset(AssetsManager.sebhaBodyImage),
              ),
            ),
          ),
        ),
      ],
    );
  }}