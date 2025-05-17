import 'package:flutter/material.dart';
import 'package:ping_me/screens/settingscreen/settings_screen.dart';
import 'package:ping_me/widgets/buildBadge.dart';
import 'package:ping_me/widgets/profile_info_item.dart';
import 'package:ping_me/widgets/profile_section.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsScreen()),
              );
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Center(
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage('https://via.placeholder.com/150'),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Alex Johnson',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  'Product Designer',
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildBadge(
                      context,
                      icon: Icons.verified,
                      label: 'Blockchain Verified',
                      color: Theme.of(context).colorScheme.primary,
                      background: Theme.of(context).colorScheme.primaryContainer,
                    ),
                    const SizedBox(width: 8),
                    buildBadge(
                      context,
                      icon: Icons.lock_outline,
                      label: 'PQC Protected',
                      color: Theme.of(context).colorScheme.secondary,
                      background: Theme.of(context).colorScheme.secondaryContainer,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
          const ProfileSection(
            title: 'Contact Information',
            children: [
              ProfileInfoItem(
                icon: Icons.email_outlined,
                label: 'Email',
                value: 'alex.johnson@example.com',
              ),
              ProfileInfoItem(
                icon: Icons.phone_outlined,
                label: 'Phone',
                value: '+1 (555) 123-4567',
              ),
              ProfileInfoItem(
                icon: Icons.business_outlined,
                label: 'Organization',
                value: 'Design Co.',
              ),
            ],
          ),
          const SizedBox(height: 24),
          ProfileSection(
            title: 'Teams & Organizations',
            children: [
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.blue.shade100,
                  child: const Icon(Icons.people_outline, color: Colors.blue),
                ),
                title: const Text('Design Team'),
                subtitle: const Text('12 members'),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.purple.shade100,
                  child: const Icon(Icons.people_outline, color: Colors.purple),
                ),
                title: const Text('Project X'),
                subtitle: const Text('8 members'),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.green.shade100,
                  child: const Icon(Icons.business_outlined, color: Colors.green),
                ),
                title: const Text('Design Co.'),
                subtitle: const Text('Organization • 45 members'),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              ),
            ],
          ),
          const SizedBox(height: 24),
          ProfileSection(
            title: 'Security & Privacy',
            children: [
              ListTile(
                leading: Icon(Icons.security_outlined, color: Theme.of(context).colorScheme.primary),
                title: const Text('Security Settings'),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              ),
              ListTile(
                leading: Icon(Icons.key_outlined, color: Theme.of(context).colorScheme.primary),
                title: const Text('Encryption Keys'),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              ),
              ListTile(
                leading: Icon(Icons.privacy_tip_outlined, color: Theme.of(context).colorScheme.primary),
                title: const Text('Privacy Controls'),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              ),
            ],
          ),
          const SizedBox(height: 24),
          ProfileSection(
            title: 'Account',
            children: [
              ListTile(
                leading: Icon(Icons.notifications_outlined, color: Theme.of(context).colorScheme.primary),
                title: const Text('Notifications'),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              ),
              ListTile(
                leading: Icon(Icons.logout, color: Theme.of(context).colorScheme.error),
                title: Text(
                  'Sign Out',
                  style: TextStyle(color: Theme.of(context).colorScheme.error),
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
