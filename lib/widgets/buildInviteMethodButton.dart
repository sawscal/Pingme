import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ping_me/themes/getRoleCardStyle.dart';

Widget buildRoleCard({
  required BuildContext context,
  required String role,
  required IconData icon,
  required String description,
  required String selectedRole,
  required VoidCallback onSelect,
}) {
  final isSelected = selectedRole == role;
  final style = getRoleCardStyle(context, isSelected);

  return InkWell(
    onTap: onSelect,
    child: Container(
      width: 140,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: style.backgroundColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: style.borderColor, width: isSelected ? 2 : 1),
        boxShadow: style.boxShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(icon, color: style.iconColor),
              if (isSelected)
                Icon(Icons.check_circle, size: 18, color: style.iconColor),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            role,
            style: TextStyle(fontWeight: FontWeight.bold, color: style.textColor),
          ),
          const SizedBox(height: 4),
          Text(
            description,
            style: TextStyle(
              fontSize: 12,
              color: Theme.of(context)
                  .colorScheme
                  .onSurface
                  .withOpacity(0.7),
            ),
          ),
        ],
      ),
    ),
  );
}
