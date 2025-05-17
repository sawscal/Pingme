import 'package:flutter/material.dart';

class RoleCardStyle {
  final Color backgroundColor;
  final Color iconColor;
  final Color textColor;
  final Color borderColor;
  final List<BoxShadow> boxShadow;

  RoleCardStyle({
    required this.backgroundColor,
    required this.iconColor,
    required this.textColor,
    required this.borderColor,
    required this.boxShadow,
  });
}

RoleCardStyle getRoleCardStyle(BuildContext context, bool isSelected) {
  final theme = Theme.of(context);
  return RoleCardStyle(
    backgroundColor: isSelected
        ? theme.colorScheme.primary.withOpacity(0.1)
        : theme.colorScheme.surface,
    iconColor: isSelected
        ? theme.colorScheme.primary
        : theme.colorScheme.onSurface,
    textColor: isSelected
        ? theme.colorScheme.primary
        : theme.colorScheme.onSurface,
    borderColor: isSelected
        ? theme.colorScheme.primary
        : theme.colorScheme.outline.withOpacity(0.3),
    boxShadow: isSelected
        ? [
            BoxShadow(
              color: theme.colorScheme.shadow.withOpacity(0.1),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ]
        : [],
  );
}
