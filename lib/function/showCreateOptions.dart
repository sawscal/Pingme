 import 'package:flutter/material.dart';

void showCreateOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Create New',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                child: Icon(
                  Icons.chat_bubble_outline,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              title: const Text('Start a new chat'),
              onTap: () {
                // Navigator.pop(context);
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => const NewChatScreen()),
                // );
              },
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
                child: Icon(
                  Icons.videocam_outlined,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              title: const Text('Create meeting'),
              onTap: () {
                // Navigator.pop(context);
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => const CreateMeetingScreen()),
                // );
              },
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
                child: Icon(
                  Icons.qr_code_scanner,
                  color: Theme.of(context).colorScheme.tertiary,
                ),
              ),
              title: const Text('Join room with code'),
              onTap: () {
                // Navigator.pop(context);
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => const JoinWithCodeScreen()),
                // );
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

