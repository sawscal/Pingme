import 'package:flutter/material.dart';
import 'package:ping_me/widgets/buildRoleCard.dart';

class RoleBasedAccessSection extends StatefulWidget {
  const RoleBasedAccessSection({super.key});

  @override
  State<RoleBasedAccessSection> createState() => _RoleBasedAccessSectionState();
}

class _RoleBasedAccessSectionState extends State<RoleBasedAccessSection> {
  String _selectedRole = 'Owner';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Role-Based Access Control',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        const Text(
          'Select default role for new participants',
          style: TextStyle(color: Colors.grey),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: [
            buildRoleCard(
              context: context,
              role: 'Owner',
              icon: Icons.admin_panel_settings,
              description: 'Full control over meeting',
              isSelected: _selectedRole == 'Owner',
              onTap: () => setState(() => _selectedRole = 'Owner'),
            ),
            buildRoleCard(
              context: context,
              role: 'Admin',
              icon: Icons.security,
              description: 'Can manage participants',
              isSelected: _selectedRole == 'Admin',
              onTap: () => setState(() => _selectedRole = 'Admin'),
            ),
            buildRoleCard(
              context: context,
              role: 'Guest',
              icon: Icons.person_outline,
              description: 'View and participate only',
              isSelected: _selectedRole == 'Guest',
              onTap: () => setState(() => _selectedRole = 'Guest'),
            ),
          ],
        ),
      ],
    );
  }
}
