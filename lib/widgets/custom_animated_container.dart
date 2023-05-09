import 'package:flutter/material.dart';

class CustomAnimatedContainer extends StatelessWidget {
  final double? width;
  final double? height;
  final Duration duration;
  final Widget? child;
  final EdgeInsetsGeometry? padding;
  final Decoration? decoration;
  final BoxConstraints? constraints;

  const CustomAnimatedContainer({
    Key? key,
    this.width,
    this.decoration,
    this.height,
    this.child,
    this.constraints,
    this.padding,
    required this.duration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: width,
      height: height,
      constraints: constraints,
      decoration: decoration,
      duration: duration,
      padding: padding,
      child: child,
    );
  }
}
