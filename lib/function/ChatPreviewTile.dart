import 'package:flutter/material.dart';

class ChatPreviewTile extends StatelessWidget {
  final String name;
  final String lastMessage;
  final String time;
  final int unread;
  final bool isGroup;
  final bool isPinned;

  const ChatPreviewTile({
    super.key,
    required this.name,
    required this.lastMessage,
    required this.time,
    required this.unread,
    required this.isGroup,
    this.isPinned = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListTile(
      leading: CircleAvatar(
        child: Text(name[0]),
      ),
      title: Text(name),
      subtitle: Text(lastMessage, maxLines: 1, overflow: TextOverflow.ellipsis),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(time, style: const TextStyle(fontSize: 12)),
          if (unread > 0)
            Container(
              margin: const EdgeInsets.only(top: 4),
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: theme.colorScheme.primary,
                shape: BoxShape.circle,
              ),
              child: Text(
                '$unread',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ),
        ],
      ),
      onTap: () {
        // Navigate to chat
      },
    );
  }
}
