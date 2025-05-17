import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MeetingSchedulerScreen extends StatefulWidget {
  const MeetingSchedulerScreen({super.key});

  @override
  State<MeetingSchedulerScreen> createState() => _MeetingSchedulerScreenState();
}

class _MeetingSchedulerScreenState extends State<MeetingSchedulerScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _titleController = TextEditingController();

  TimeOfDay _startTime = TimeOfDay.now();
  TimeOfDay _endTime = TimeOfDay.now();

  void _scheduleMeeting() {
    if (_formKey.currentState!.validate()) {
      final roomCode = 'meet-${DateTime.now().millisecondsSinceEpoch.toString().substring(7)}';

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Meeting Scheduled'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Time: ${_startTime.format(context)} - ${_endTime.format(context)}'),
              const SizedBox(height: 8),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Close'),
            ),
            FilledButton(
              onPressed: () {
                Clipboard.setData(ClipboardData(text: roomCode));
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Room link copied to clipboard')),
                );
                Navigator.of(context).pop();
              },
              child: const Text('Copy Link'),
            ),
          ],
        ),
      );
    }
  }

  Future<void> _selectStartTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _startTime,
    );
    if (picked != null && picked != _startTime) {
      setState(() {
        _startTime = picked;
        if (_timeToDouble(_endTime) <= _timeToDouble(_startTime)) {
          _endTime = TimeOfDay(hour: _startTime.hour + 1, minute: _startTime.minute);
        }
      });
    }
  }

  Future<void> _selectEndTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _endTime,
    );
    if (picked != null && picked != _endTime) {
      setState(() {
        if (_timeToDouble(picked) > _timeToDouble(_startTime)) {
          _endTime = picked;
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('End time must be after start time'),
              backgroundColor: Colors.red,
            ),
          );
        }
      });
    }
  }

  double _timeToDouble(TimeOfDay time) => time.hour + time.minute / 60.0;

  Widget _buildTimeSelectors() {
    return Row(
      children: [
        Expanded(
          child: InkWell(
            onTap: _selectStartTime,
            child: InputDecorator(
              decoration: const InputDecoration(
                labelText: 'Start',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.access_time),
              ),
              child: Text(_startTime.format(context)),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: InkWell(
            onTap: _selectEndTime,
            child: InputDecorator(
              decoration: const InputDecoration(
                labelText: 'End',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.access_time),
              ),
              child: Text(_endTime.format(context)),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Schedule Meeting')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: 'Meeting Title',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.title),
                ),
                validator: (value) => value == null || value.isEmpty
                    ? 'Please enter a meeting title'
                    : null,
              ),
              const SizedBox(height: 20),
              _buildTimeSelectors(),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _scheduleMeeting,
                child: const Text('Schedule'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
