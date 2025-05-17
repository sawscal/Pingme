 import 'package:flutter/cupertino.dart';
import 'package:ping_me/widgets/buildAgendaField.dart';
import 'package:ping_me/widgets/buildCalendarIntegration.dart';
import 'package:ping_me/widgets/buildDatePicker.dart';
import 'package:ping_me/widgets/buildParticipantsSection.dart';
import 'package:ping_me/widgets/buildTimeSelectors.dart';
import 'package:ping_me/widgets/buildTitleField.dart';

class NarrowSchedulingLayout extends StatefulWidget {
  @override
  _NarrowSchedulingLayoutState createState() => _NarrowSchedulingLayoutState();
}

class _NarrowSchedulingLayoutState extends State<NarrowSchedulingLayout> {
  DateTime? _selectedDate;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleScreen(),
        const SizedBox(height: 20),
        DatePickerField(
          selectedDate: _selectedDate, // Pass selected date
          onDateChanged: (date) {
            setState(() {
              _selectedDate = date; // Update selected date
            });
          },
        ),
        const SizedBox(height: 16),
        MeetingSchedulerScreen(),
        const SizedBox(height: 20),
        buildCalendarIntegration(),
        const SizedBox(height: 20),
        ParticipantsSection(),
        const SizedBox(height: 20),
        MeetingAgendaScreen(),
      ],
    );
  }
}
