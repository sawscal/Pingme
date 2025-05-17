import 'package:flutter/material.dart';
import 'package:ping_me/components/connected_app_tile.dart';
import 'package:ping_me/components/settings_card.dart';

class ConnectedAppsCard extends StatelessWidget {
  const ConnectedAppsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingsCard(
      icon: Icons.apps,
      title: 'Connected Apps',
      child: Column(
        children: [
          const ConnectedAppTile(name: 'Google Drive', connected: true, avatarLetter: 'G', color: Colors.blue),
          const ConnectedAppTile(name: 'Dropbox', connected: false, avatarLetter: 'D', color: Colors.grey),
          const SizedBox(height: 10),
          OutlinedButton(onPressed: () {}, child: const Text('+ Add New App')),
        ],
      ),
    );
  }
}
