import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// StatefulWidget for selecting calendars
class CalendarSelectionScreen extends StatefulWidget {
  final String calendarName;
  final IconData calendarIcon;

  const CalendarSelectionScreen(this.calendarName, this.calendarIcon, {Key? key}) : super(key: key);

  @override
  _CalendarSelectionScreenState createState() => _CalendarSelectionScreenState();
}

class _CalendarSelectionScreenState extends State<CalendarSelectionScreen> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected
              ? Theme.of(context).colorScheme.primaryContainer
              : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.outline,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              widget.calendarIcon,
              size: 16,
              color: isSelected
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.onSurface,
            ),
            const SizedBox(width: 6),
            Text(
              widget.calendarName,
              style: TextStyle(
                color: isSelected
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ],
        ),
      ),
    );
  }
}