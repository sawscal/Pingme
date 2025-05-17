import 'package:flutter/material.dart';

class MeetingCard extends StatelessWidget {
  final String title;
  final String time;
  final int participants;
  final bool isStarted;

  const MeetingCard({
    Key? key,
    required this.title,
    required this.time,
    required this.participants,
    required this.isStarted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      margin: const EdgeInsets.only(right: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceVariant,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Row(
            children: [
              Icon(Icons.schedule, size: 16, color: Colors.grey),
              const SizedBox(width: 4),
              Text(time, style: const TextStyle(fontSize: 12)),
            ],
          ),
          const Spacer(),
          Row(
            children: [
              Icon(Icons.group, size: 16, color: Colors.grey),
              const SizedBox(width: 4),
              Text('$participants Participants', style: const TextStyle(fontSize: 12)),
              const Spacer(),
              if (isStarted)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text(
                    'Live',
                    style: TextStyle(color: Colors.green, fontSize: 12),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
