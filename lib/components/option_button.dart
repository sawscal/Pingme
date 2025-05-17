import 'package:flutter/material.dart';

class OptionButton extends StatelessWidget {
  final String label;
  final IconData icon;

  const OptionButton({super.key, required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: () {},
      icon: Icon(icon),
      label: Text(label),
    );
  }
}
