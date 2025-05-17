import 'package:flutter/material.dart';

class ConnectedAppTile extends StatelessWidget {
  final String name;
  final bool connected;
  final String avatarLetter;
  final Color color;

  const ConnectedAppTile({
    super.key,
    required this.name,
    required this.connected,
    required this.avatarLetter,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: color.withOpacity(0.1),
        child: Text(avatarLetter, style: TextStyle(color: color)),
      ),
      title: Text(name),
      subtitle: Text(connected ? 'Connected' : 'Not Connected'),
      trailing: connected
          ? Switch(value: true, onChanged: (_) {})
          : TextButton(onPressed: () {}, child: const Text('Connect')),
    );
  }
}
