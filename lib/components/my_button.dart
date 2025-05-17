import 'package:flutter/cupertino.dart';

class MyButton extends StatelessWidget {
  final String text;
  final double borderRadius;
  final double padding;
  final VoidCallback onTap;
  final double horizontalMargin;
  final double verticalMargin;
  final Color color;
  final Color textColor;
  final Icon? icon;
  final TextStyle? textStyle; // Add this

  // Default textColor to black if not provided
  MyButton({
    required this.text,
    required this.borderRadius,
    required this.padding,
    required this.onTap,
    required this.horizontalMargin,
    required this.verticalMargin,
    required this.color,
    required this.textColor,
    this.icon,
    this.textStyle,

    //this.textColor = Colors.black, // Default to black
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: horizontalMargin,
          vertical: verticalMargin,
        ),
        padding: EdgeInsets.all(padding),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) ...[
                icon!, // Display the icon only if it's not null
                SizedBox(width: 10), // Space between the icon and text
              ],
              Text(
                text,
                style: textStyle ?? TextStyle(color: textColor), // Use custom textStyle or default textColor
              ),
            ],
          ),
        ),
      ),
    );
  }
}