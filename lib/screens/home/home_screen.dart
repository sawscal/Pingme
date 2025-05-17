import 'package:flutter/material.dart';
import 'package:ping_me/screens/chat_screen.dart/chatscreen.dart' show ChatScreen;
import 'package:ping_me/widgets/greeting_section.dart';
import 'package:ping_me/widgets/notifications_section.dart';
import 'package:ping_me/widgets/quick_actions_section.dart';
import 'package:ping_me/widgets/recent_chats_section.dart';
import 'package:ping_me/widgets/upcoming_meetings_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text('PINGme', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {
              Navigator.pushNamed(context, '/notifications');
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ListView(
            children: [
              // Greeting Section
              GreetingSection(),
              SizedBox(height: 24),

              // Upcoming Meetings Section
              // UpcomingMeetingsSection(),
              // SizedBox(height: 24),

              // Recent Chats Section - Added Chat Room List
              _ChatRoomSection(),
              SizedBox(height: 24),

              // Notifications Section
              NotificationsSection(),
              SizedBox(height: 24),

              // Quick Actions Section
              QuickActionsSection(),
            ],
          ),
        ),
      ),
    );
  }
Widget _ChatRoomSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Chat Rooms',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 12),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: 3, // Placeholder number of rooms, can be dynamic
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('Room ${index + 1}'),
              subtitle: Text('Click to join chat room'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChatScreen(roomId: 'room${index + 1}')),
                );
              },
            );
          },
        ),
      ],
    );
  }
}
