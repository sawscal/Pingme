import 'package:flutter/material.dart';

class ToggleRow extends StatelessWidget {
  final String label;
  final bool value;

  const ToggleRow({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: Text(label),
      value: value,
      onChanged: (_) {}, // Add your logic here
    );
  }
}
