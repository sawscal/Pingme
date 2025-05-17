import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SecuritySettingsScreen(),
    );
  }
}

class SecuritySettingsScreen extends StatefulWidget {
  const SecuritySettingsScreen({super.key});

  @override
  State<SecuritySettingsScreen> createState() => _SecuritySettingsScreenState();
}

class _SecuritySettingsScreenState extends State<SecuritySettingsScreen> {
  bool _requireBiometric = false;
  bool _tokenGated = false;
  String _selectedExpiration = '15 minutes after meeting ends';

  Widget buildSecuritySettingsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Security Settings',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Theme.of(context).colorScheme.outline.withOpacity(0.3),
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                SwitchListTile(
                  title: const Text('Require Biometric Verification'),
                  subtitle: const Text('Fingerprint or Face ID to join meeting'),
                  value: _requireBiometric,
                  onChanged: (value) {
                    setState(() {
                      _requireBiometric = value;
                    });
                  },
                  secondary: const Icon(Icons.fingerprint),
                  contentPadding: EdgeInsets.zero,
                ),
                const Divider(),
                SwitchListTile(
                  title: const Text('Token-Gated Access'),
                  subtitle: const Text('Require token ownership for DAO/Enterprise'),
                  value: _tokenGated,
                  onChanged: (value) {
                    setState(() {
                      _tokenGated = value;
                    });
                  },
                  secondary: const Icon(Icons.token),
                  contentPadding: EdgeInsets.zero,
                ),
                const Divider(),
                SwitchListTile(
                  title: const Text('End-to-End Encryption'),
                  subtitle: const Text('Enhanced security for sensitive meetings'),
                  value: true,
                  onChanged: null, // Disabled
                  secondary: const Icon(Icons.enhanced_encryption),
                  contentPadding: EdgeInsets.zero,
                ),
                const Divider(),
                SwitchListTile(
                  title: const Text('Waiting Room'),
                  subtitle: const Text('Manually approve participants'),
                  value: true,
                  onChanged: null, // Disabled
                  secondary: const Icon(Icons.door_front_door),
                  contentPadding: EdgeInsets.zero,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 24),
        const Text(
          'Auto-expiration',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          decoration: const InputDecoration(
            labelText: 'Access link expires',
            border: OutlineInputBorder(),
          ),
          value: _selectedExpiration,
          items: [
            '15 minutes after meeting ends',
            '1 hour after meeting ends',
            '24 hours after meeting ends',
            'Never (not recommended)',
          ].map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (newValue) {
            setState(() {
              _selectedExpiration = newValue!;
            });
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Security Settings')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: buildSecuritySettingsSection(),
      ),
    );
  }
}
