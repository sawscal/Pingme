import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final void Function()? onTap;
  final double borderRadius;
  final double padding;
  final double horizontalMargin;
  final double verticalMargin;
  final Color color;

  final String? text;
  final Widget? child;

  const MyButton({
    super.key,
    required this.onTap,
    required this.borderRadius,
    required this.padding,
    required this.horizontalMargin,
    required this.verticalMargin,
    required this.color,
    this.text,
    this.child,
  }) : assert(text != null || child != null, 'Either text or child must be provided');

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        padding: EdgeInsets.all(padding),
        margin: EdgeInsets.symmetric(
          horizontal: horizontalMargin,
          vertical: verticalMargin,
        ),
        child: Center(
          child: child ??
              Text(
                text!,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
        ),
      ),
    );
  }
}
