import 'package:flutter/material.dart';

class GreetingSection extends StatelessWidget {
  const GreetingSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 24,
          backgroundImage: const NetworkImage('https://via.placeholder.com/150'),
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome back',
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontSize: 14,
              ),
            ),
            const Text(
              'Alex Johnson',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ],
        ),
        const Spacer(),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              Icon(Icons.verified, size: 16, color: Theme.of(context).colorScheme.primary),
              const SizedBox(width: 4),
              Text(
                'Verified',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

