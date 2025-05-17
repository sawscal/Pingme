import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ping_me/function/ChatPreviewTile.dart';
import 'package:ping_me/widgets/buildChipFilter.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chats'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Show search
            },
          ),
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {
              // Show filters
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          // Chat room types tabs
          Container(
            height: 40,
            margin: const EdgeInsets.only(bottom: 16),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                buildChipFilter(context, 'All', true),
                buildChipFilter(context, 'Private Rooms', false),
                buildChipFilter(context, 'Public Discussions', false),
                buildChipFilter(context, 'Meeting Rooms', false),
              ],
            ),
          ),
          
          // Pinned chats
          if (true) // Condition to check if there are pinned chats
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                'Pinned',
                style: TextStyle(
                  fontSize: 14,
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          
          const ChatPreviewTile(
            name: 'Leadership Team',
            lastMessage: 'CEO: Let\'s discuss the Q3 results',
            time: '5m ago',
            unread: 2,
            isGroup: true,
            isPinned: true,
          ),
          
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              'All Chats',
              style: TextStyle(
                fontSize: 14,
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          
          // Regular chats
          const ChatPreviewTile(
            name: 'Design Team',
            lastMessage: 'Sarah: Ive uploaded the new mockups',
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
          const ChatPreviewTile(
            name: 'Emma Williams',
            lastMessage: 'Thanks for your help!',
            time: '5h ago',
            unread: 0,
            isGroup: false,
          ),
          const ChatPreviewTile(
            name: 'Development Team',
            lastMessage: 'Mike: PR is ready for review',
            time: 'Yesterday',
            unread: 0,
            isGroup: true,
          ),
          const ChatPreviewTile(
            name: 'Sarah Johnson',
            lastMessage: 'See you at the meeting',
            time: 'Yesterday',
            unread: 0,
            isGroup: false,
          ),
          const ChatPreviewTile(
            name: 'Marketing Campaign',
            lastMessage: 'Lisa: Here are the social media assets',
            time: 'Yesterday',
            unread: 0,
            isGroup: true,
          ),
        ],
      ),
    );
  }
  }
