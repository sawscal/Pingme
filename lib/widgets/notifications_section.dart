import 'package:flutter/material.dart';
import 'package:ping_me/function/notification_item.dart';
import 'package:ping_me/function/section_header.dart';

class NotificationsSection extends StatelessWidget {
  const NotificationsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(title: 'Notifications'),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: isDarkMode ? const Color(0xFF1E1E1E) : Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            children: const [
              NotificationItem(
                icon: Icons.person_add,
                title: 'New team invitation',
                description: 'Marketing Team wants to add you',
                time: '5m ago',
              ),
              Divider(height: 24),
              NotificationItem(
                icon: Icons.calendar_today,
                title: 'Meeting reminder',
                description: 'Product Design Review in 30 minutes',
                time: '15m ago',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
