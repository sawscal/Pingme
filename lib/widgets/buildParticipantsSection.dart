import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class ParticipantsSection extends StatefulWidget {
  @override
  _ParticipantsSectionState createState() => _ParticipantsSectionState();
}

class _ParticipantsSectionState extends State<ParticipantsSection> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _participantController = TextEditingController();

  List<String> _participants = [];
  bool _requireBiometric = false;
  bool _tokenGated = false;
  String roomCode = 'https://secure.meeting/abc123';
  @override
  void dispose() {
    _titleController.dispose();
    _participantController.dispose();
    super.dispose();
  }

  void _addParticipant() {
    if (_participantController.text.trim().isNotEmpty) {
      setState(() {
        _participants.add(_participantController.text.trim());
        _participantController.clear();
      });
    }
  }

  void _removeParticipant(int index) {
    setState(() {
      _participants.removeAt(index);
    });
  }

  Widget buildParticipantsSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: Text(
            'Participants',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: _participantController,
                decoration: const InputDecoration(
                  labelText: 'Add participant',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
                onFieldSubmitted: (_) => _addParticipant(),
              ),
            ),
            const SizedBox(width: 8),
            IconButton.filled(
              onPressed: _addParticipant,
              icon: const Icon(Icons.add),
            ),
          ],
        ),
        const SizedBox(height: 8),
        _participants.isEmpty
            ? const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'No participants added',
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: Colors.grey,
                  ),
                ),
              )
            : Wrap(
                spacing: 8,
                runSpacing: 8,
                children: _participants.asMap().entries.map((entry) {
                  return Chip(
                    label: Text(entry.value),
                    deleteIcon: const Icon(Icons.close, size: 16),
                    onDeleted: () => _removeParticipant(entry.key),
                  );
                }).toList(),
              ),
      ],
    );
  }

  Widget buildSecuritySettingsSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Security Settings',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Theme.of(context).colorScheme.outline.withOpacity(0.3)),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                SwitchListTile(
                  title: const Text('Require Biometric Verification'),
                  subtitle: const Text('Fingerprint or Face ID to join meeting'),
                  value: _requireBiometric,
                  onChanged: (value) {
                    setState(() {
                      _requireBiometric = value;
                    });
                  },
                  secondary: const Icon(Icons.fingerprint),
                  contentPadding: EdgeInsets.zero,
                ),
                const Divider(),
                SwitchListTile(
                  title: const Text('Token-Gated Access'),
                  subtitle: const Text('Require token ownership for DAO/Enterprise'),
                  value: _tokenGated,
                  onChanged: (value) {
                    setState(() {
                      _tokenGated = value;
                    });
                  },
                  secondary: const Icon(Icons.token),
                  contentPadding: EdgeInsets.zero,
                ),
              ],
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
        child: ListView(
          children: [
            TextFormField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: 'Meeting Title',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.title),
              ),
            ),
            const SizedBox(height: 16),
            buildParticipantsSection(context),
            const SizedBox(height: 24),
            buildSecuritySettingsSection(context),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
