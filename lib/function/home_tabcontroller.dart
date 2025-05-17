import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatsTabStyled extends StatelessWidget {
  const ChatsTabStyled({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Your Chats 💬',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          Text(
            'Join meaningful conversations or start one.',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          SizedBox(height: 40),
          Expanded(
            child: Center(
              child: Text(
                'No active chats yet.',
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CallsTabStyled extends StatelessWidget {
  const CallsTabStyled({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Your Calls 📞',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          Text(
            'Stay in touch with valuable voices.',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          SizedBox(height: 40),
          Expanded(
            child: Center(
              child: Text(
                'No call history yet.',
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SettingsTabStyled extends StatelessWidget {
  const SettingsTabStyled({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Settings ⚙️',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          Text(
            'Control your space and preferences.',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          SizedBox(height: 40),
          Expanded(
            child: Center(
              child: Text(
                'All settings will appear here.',
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
