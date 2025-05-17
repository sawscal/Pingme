import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ping_me/widgets/buildCalendarOption.dart';

Widget buildCalendarIntegration() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: Text(
            'Calendar Integration',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Row(
          children: [
            CalendarSelectionScreen('Google', Icons.calendar_month),
            const SizedBox(width: 16),
            CalendarSelectionScreen('Outlook', Icons.calendar_view_month),
            const SizedBox(width: 16),
            CalendarSelectionScreen('Apple', Icons.calendar_today),
          ],
        ),
      ],
    );
  }