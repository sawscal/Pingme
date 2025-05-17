import 'package:flutter/material.dart';

class ChatPreviewTile extends StatelessWidget {
  final String name;
  final String lastMessage;
  final String time;
  final int unread;
  final bool isGroup;

  const ChatPreviewTile({
    Key? key,
    required this.name,
    required this.lastMessage,
    required this.time,
    required this.unread,
    required this.isGroup,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 8),
      leading: CircleAvatar(
        radius: 24,
        backgroundColor: isGroup
            ? Theme.of(context).colorScheme.tertiaryContainer
            : Theme.of(context).colorScheme.primaryContainer,
        child: Icon(
          isGroup ? Icons.group : Icons.person,
          color: Theme.of(context).colorScheme.onPrimaryContainer,
        ),
      ),
      title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(
        lastMessage,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(time, style: const TextStyle(fontSize: 12)),
          if (unread > 0)
            Container(
              margin: const EdgeInsets.only(top: 4),
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                shape: BoxShape.circle,
              ),
              child: Text(
                unread.toString(),
                style: const TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
        ],
      ),
    );
  }
}
