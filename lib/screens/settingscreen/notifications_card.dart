import 'package:flutter/material.dart';
import 'package:ping_me/components/settings_card.dart';
import 'package:ping_me/components/toggle_row.dart';
class NotificationsCard extends StatelessWidget {
  const NotificationsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingsCard(
      icon: Icons.notifications,
      title: 'Notifications',
      child: Column(
        children: const [
          ToggleRow(label: 'Push Notifications', value: true),
          ToggleRow(label: 'Email Notifications', value: false),
          ToggleRow(label: 'Sound Alerts', value: true),
        ],
      ),
    );
  }
}
