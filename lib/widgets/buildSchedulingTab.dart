import 'package:flutter/material.dart';
import 'package:ping_me/widgets/buildNarrowSchedulingLayout.dart';
import 'package:ping_me/widgets/buildWideSchedulingLayout.dart';

class SchedulingTab extends StatefulWidget {
  const SchedulingTab({Key? key, required GlobalKey<FormState> formKey, required TextEditingController titleController}) : super(key: key);

  @override
  State<SchedulingTab> createState() => _SchedulingTabState();
}

class _SchedulingTabState extends State<SchedulingTab> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _scheduleMeeting() {
    if (_formKey.currentState!.validate()) {
      // Generate a secure room link
      final roomCode = 'meet-${DateTime.now().millisecondsSinceEpoch.toString().substring(7)}';

      // Show confirmation or navigate
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Meeting Scheduled: $roomCode')),
      );

      // TODO: Add logic to actually schedule the meeting (e.g., API call)
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return constraints.maxWidth > 600
                ? WideSchedulingLayout()
                : NarrowSchedulingLayout();
          },
        ),
      ),
    );
  }
}
