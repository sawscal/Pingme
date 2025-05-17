import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ping_me/screens/creatingroom/room_avatar.dart';

class SelectRoomTopicScreen extends StatefulWidget {
  @override
  _SelectRoomTopicScreenState createState() => _SelectRoomTopicScreenState();
}

class _SelectRoomTopicScreenState extends State<SelectRoomTopicScreen> {
  int? selectedIndex;

  final List<Map<String, dynamic>> topics = [
    {'icon': Icons.work, 'title': 'Work', 'subtitle': 'Where deadlines lurk and coffee flows.', 'color': Colors.deepPurple},
    {'icon': Icons.home, 'title': 'Neighborhood', 'subtitle': 'We’re sure the neighbors won’t be noisy.', 'color': Colors.green},
    {'icon': Icons.sports_soccer, 'title': 'Sport club', 'subtitle': 'Get together to discuss your victories.', 'color': Colors.pink},
    {'icon': Icons.lock, 'title': 'Secret room', 'subtitle': 'The first rule of secret room is:\nyou do not talk about secret room.', 'color': Colors.blueGrey},
    {'icon': Icons.favorite, 'title': 'Love', 'subtitle': 'We hope there will never be any evil emoji in this chat room.', 'color': Colors.redAccent},
    {'icon': Icons.travel_explore, 'title': 'Travels', 'subtitle': 'Plan your next adventures together.', 'color': Colors.orange},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,  // Fixed typo here: 'backgroundColor' instead of 'BackgroundColor'
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: BackButton(color: Colors.black),
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: SafeArea(  // SafeArea correctly wrapping the body content
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Select room topic",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                "Select a topic for your group to categorize by collection",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 24),
              Expanded(
                child: ListView.builder(
                  physics: ClampingScrollPhysics(), // smoother scrolling
                  itemCount: topics.length,
                  itemBuilder: (context, index) {
                    final topic = topics[index];
                    final isSelected = selectedIndex == index;

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 250),
                        curve: Curves.easeInOut,
                        margin: const EdgeInsets.symmetric(vertical: 6),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: isSelected ? Colors.grey.shade200 : Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: isSelected ? Colors.black : Colors.grey.shade300,
                            width: isSelected ? 1.5 : 1,
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              topic['icon'],
                              size: 28,
                              color: isSelected ? Colors.black : topic['color'],
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    topic['title'],
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    topic['subtitle'],
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 12),
    ElevatedButton.icon(
  onPressed: selectedIndex != null ? () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const RoomAvatarPage(),
      ),
    );
  } : null,
  icon: const Icon(Icons.arrow_forward), // forward icon
  label: const Text("Continue"),
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.black,
    foregroundColor: Colors.white,
    minimumSize: const Size(double.infinity, 50),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),
  ),
)

            ],
          ),
        ),
      ),
    );
  }
}
