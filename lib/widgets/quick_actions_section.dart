import 'package:flutter/material.dart';
import 'package:ping_me/function/quick_action_button.dart';

class QuickActionsSection extends StatelessWidget {
  const QuickActionsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        QuickActionButton(
          icon: Icons.video_call,
          label: 'New Meeting',
          color: Theme.of(context).colorScheme.primary,
          onTap: () => Navigator.pushNamed(context, '/create-meeting'),
        ),
        QuickActionButton(
          icon: Icons.chat,
          label: 'New Chat',
          color: Theme.of(context).colorScheme.secondary,
          onTap: () => Navigator.pushNamed(context, '/new-chat'),
        ),
        QuickActionButton(
          icon: Icons.qr_code_scanner,
          label: 'Scan Code',
          color: Theme.of(context).colorScheme.tertiary,
          onTap: () => Navigator.pushNamed(context, '/join-code'),
        ),
      ],
    );
  }
}
