import 'package:flutter/material.dart';

class NotificationItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final String time;

  const NotificationItem({
    Key? key,
    required this.icon,
    required this.title,
    required this.description,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          child: Icon(icon, color: Theme.of(context).colorScheme.primary),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
              Text(description, style: const TextStyle(fontSize: 12)),
            ],
          ),
        ),
        const SizedBox(width: 8),
        Text(time, style: const TextStyle(fontSize: 12, color: Colors.grey)),
      ],
    );
  }
}
