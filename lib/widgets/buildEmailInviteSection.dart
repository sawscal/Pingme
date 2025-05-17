 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget buildEmailInviteSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Participants will receive an email with a secure link to join the meeting',
          style: TextStyle(color: Colors.grey),
        ),
        const SizedBox(height: 16),
        SwitchListTile(
          title: const Text('Send calendar invitation'),
          subtitle: const Text('Attach .ics file to the email'),
          value: true,
          onChanged: (value) {},
          contentPadding: EdgeInsets.zero,
        ),
      ],
    );
  }