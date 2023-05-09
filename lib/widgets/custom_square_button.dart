import 'package:flutter/material.dart';

class CustomFilledSquareButton extends StatelessWidget {
  final void Function()? onPressed;
  final Widget? child;
  final EdgeInsetsGeometry padding;

  const CustomFilledSquareButton({
    Key? key,
    required this.padding,
    this.child,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: FilledButton(
          style: ButtonStyle(
            minimumSize: MaterialStateProperty.all(
              const Size(50.0, 50.0),
            ),
          ),
          onPressed: onPressed,
          child: child),
    );
  }
}
