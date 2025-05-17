import 'package:flutter/material.dart';
import 'package:ping_me/widgets/buildAgendaField.dart';
import 'package:ping_me/widgets/buildCalendarIntegration.dart';
import 'package:ping_me/widgets/buildDatePicker.dart';
import 'package:ping_me/widgets/buildParticipantsSection.dart';
import 'package:ping_me/widgets/buildTimeSelectors.dart';
import 'package:ping_me/widgets/buildTitleField.dart';

class WideSchedulingLayout extends StatefulWidget {
  const WideSchedulingLayout({super.key});

  @override
  State<WideSchedulingLayout> createState() => _WideSchedulingLayoutState();
}

class _WideSchedulingLayoutState extends State<WideSchedulingLayout> {
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitleScreen(),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: DatePickerField(
                          onDateChanged: (date) {
                            setState(() {
                              _selectedDate = date;
                            });
                          },
                        ),
                      ),
                      const SizedBox(width: 16),
                      const Expanded(
                        child: MeetingSchedulerScreen(),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  buildCalendarIntegration(),
                ],
              ),
            ),
            const SizedBox(width: 32),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ParticipantsSection(),
                  const SizedBox(height: 20),
                  MeetingAgendaScreen(),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
