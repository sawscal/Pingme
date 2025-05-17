import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class ChatScreen extends StatefulWidget {
  final String roomId;

  ChatScreen({required this.roomId});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  WebSocketChannel? channel;
  TextEditingController messageController = TextEditingController();
  List<String> messages = [];

  @override
  void initState() {
    super.initState();
    _connectToChat();
  }

  void _connectToChat() {
    channel = WebSocketChannel.connect(Uri.parse('ws://127.0.0.1:8080/ws'));
    channel?.stream.listen((message) {
      setState(() {
        messages.add(message);
      });
    });
    channel?.sink.add(json.encode({'action': 'join', 'roomId': widget.roomId}));
  }

  void _sendMessage() {
    if (messageController.text.isNotEmpty) {
      channel?.sink.add(messageController.text);
      setState(() {
        messages.add(messageController.text);
      });
      messageController.clear();
    }
  }

  @override
  void dispose() {
    channel?.sink.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Chat - ${widget.roomId}')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return ListTile(title: Text(messages[index]));
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: messageController,
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
