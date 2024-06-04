import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class SizeAnimationX extends StatelessWidget {
  final double delay;
  final Widget child;

  const SizeAnimationX({required this.child,this.delay = 0.8 ,super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: Duration(milliseconds: (1000 * delay).round()),
      curve: Curves.easeIn,
      reverseDuration: Duration(milliseconds: (1000 * delay).round()),
      child: child,
    );
  }
}