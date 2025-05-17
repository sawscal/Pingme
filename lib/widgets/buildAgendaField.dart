import 'package:flutter/material.dart';

class MeetingAgendaScreen extends StatefulWidget {
  @override
  _MeetingAgendaScreenState createState() => _MeetingAgendaScreenState();
}

class _MeetingAgendaScreenState extends State<MeetingAgendaScreen> {
  final TextEditingController _agendaController = TextEditingController();

  @override
  void dispose() {
    _agendaController.dispose();
    super.dispose();
  }

  Widget buildAgendaField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: Text(
            'Meeting Agenda',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        TextFormField(
          controller: _agendaController,
          maxLines: 5,
          decoration: const InputDecoration(
            hintText: 'Add meeting agenda or notes...',
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Agenda')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: buildAgendaField(),
      ),
    );
  }
}
