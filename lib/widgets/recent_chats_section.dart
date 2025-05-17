import 'package:flutter/material.dart';
import 'package:ping_me/function/ChatPreviewTile.dart';
import 'package:ping_me/function/section_header.dart';

class RecentChatsSection extends StatelessWidget {
  const RecentChatsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SectionHeader(title: 'Recent Chats'),
            TextButton(onPressed: () {}, child: const Text('See all')),
          ],
        ),
        const SizedBox(height: 8),
        const ChatPreviewTile(
          name: 'Design Team',
          lastMessage: 'Sarah: I\'ve uploaded the new mockups',
          time: '10m ago',
          unread: 3,
          isGroup: true,
        ),
        const ChatPreviewTile(
          name: 'John Smith',
          lastMessage: 'Can you review the document I shared?',
          time: '1h ago',
          unread: 0,
          isGroup: false,
        ),
        const ChatPreviewTile(
          name: 'Project X',
          lastMessage: 'Meeting notes are now available',
          time: '3h ago',
          unread: 1,
          isGroup: true,
        ),
      ],
    );
  }
}
