import 'package:flutter/material.dart';
import 'package:ping_me/components/option_button.dart';
import 'package:ping_me/components/settings_card.dart';

class SecurityCard extends StatelessWidget {
  const SecurityCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingsCard(
      icon: Icons.lock,
      title: 'Security',
      child: Column(
        children: [
          ListTile(
            title: const Text('Change PQC Method'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.description),
            title: const Text('Export Private Key'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
          ),
          const SizedBox(height: 12),
          const Text('Secure Backup', style: TextStyle(fontWeight: FontWeight.bold)),
          Wrap(
            spacing: 8,
            children: const [
              OptionButton(label: 'IPFS', icon: Icons.storage),
              OptionButton(label: 'Device', icon: Icons.devices),
            ],
          ),
        ],
      ),
    );
  }
}
