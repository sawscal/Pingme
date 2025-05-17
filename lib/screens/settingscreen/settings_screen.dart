import 'package:flutter/material.dart';
import 'package:ping_me/screens/settingscreen/QuantumSettingsCard.dart';
import 'package:ping_me/screens/settingscreen/appearance_card.dart';
import 'package:ping_me/screens/settingscreen/connected_apps_card.dart';
import 'package:ping_me/screens/settingscreen/notifications_card.dart';
import 'package:ping_me/screens/settingscreen/security_card.dart';
import 'package:provider/provider.dart';


class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      appBar: AppBar(
        title: const Text('Settings'),
        actions: [
          IconButton(icon: const Icon(Icons.logout), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children:  [
            AppearanceCard(),
            NotificationsCard(),
            SecurityCard(),
            ConnectedAppsCard(),
            QuantumSettingsCard(),
          ],
        ),
      ),
    );
  }
}
