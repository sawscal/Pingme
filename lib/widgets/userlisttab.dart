import 'package:flutter/material.dart';

Widget _buildActivityTab() {
  final List<Map<String, dynamic>> activities = [
    {
      'user': 'Sarah Johnson',
      'action': 'Created new design project',
      'time': '10:30 AM',
      'date': 'May 1, 2025',
      'icon': Icons.create_new_folder,
    },
    {
      'user': 'John Smith',
      'action': 'Added new team member',
      'time': '09:45 AM',
      'date': 'May 1, 2025',
      'icon': Icons.person_add,
    },
    {
      'user': 'Michael Wong',
      'action': 'Updated profile information',
      'time': '08:20 AM',
      'date': 'May 1, 2025',
      'icon': Icons.edit,
    },
    {
      'user': 'Emma Wilson',
      'action': 'Created new channel: #marketing',
      'time': '04:15 PM',
      'date': 'Apr 30, 2025',
      'icon': Icons.add_circle,
    },
    {
      'user': 'System',
      'action': 'Blockchain verification updated',
      'time': '02:30 PM',
      'date': 'Apr 30, 2025',
      'icon': Icons.security,
    },
    {
      'user': 'Lisa Chen',
      'action': 'Pushed code to repository',
      'time': '01:45 PM',
      'date': 'Apr 30, 2025',
      'icon': Icons.code,
    },
    {
      'user': 'David Park',
      'action': 'Updated UI components',
      'time': '11:20 AM',
      'date': 'Apr 30, 2025',
      'icon': Icons.design_services,
    },
    {
      'user': 'Sarah Johnson',
      'action': 'Reviewed design proposal',
      'time': '10:05 AM',
      'date': 'Apr 30, 2025',
      'icon': Icons.rate_review,
    },
    {
      'user': 'John Smith',
      'action': 'Assigned new task',
      'time': '09:30 AM',
      'date': 'Apr 30, 2025',
      'icon': Icons.assignment,
    },
  ];

  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Activity Logs',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 16),
        // Date filter row
        Row(
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'From Date',
                  prefixIcon: Icon(Icons.calendar_today),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'To Date',
                  prefixIcon: Icon(Icons.calendar_today),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(width: 16),
            ElevatedButton(
              onPressed: () {},
              child: Text('Filter'),
            ),
          ],
        ),
        SizedBox(height: 16),
        Expanded(
          child: Card(
            elevation: 4,
            child: ListView.builder(
              itemCount: activities.length,
              itemBuilder: (context, index) {
                final activity = activities[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor:
                        Theme.of(context).primaryColor.withOpacity(0.2),
                    child: Icon(
                      activity['icon'],
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  title: Text(activity['action']),
                  subtitle: Text(
                    'By ${activity['user']} • ${activity['time']}',
                  ),
                  trailing: Text(activity['date']),
                );
              },
            ),
          ),
        ),
      ],
    ),
  );
}
