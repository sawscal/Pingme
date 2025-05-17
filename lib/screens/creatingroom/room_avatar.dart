import 'package:flutter/material.dart';
import 'package:ping_me/themes/Appstyle.dart';

class RoomAvatarPage extends StatefulWidget {
  const RoomAvatarPage({Key? key}) : super(key: key);

  @override
  State<RoomAvatarPage> createState() => _RoomAvatarPageState();
}

class _RoomAvatarPageState extends State<RoomAvatarPage> {
  int selectedColorIndex = 0;
  


  
  final List<ColorOption> colorOptions = const [
    ColorOption(Color(0xFFD8EFD8), "Light Green"),
    ColorOption(Color(0xFFD8D8EF), "Light Purple"),
    ColorOption(Color(0xFFDCD8EF), "Light Lavender"),
    ColorOption(Color(0xFFD8DCDC), "Light Gray"),
    ColorOption(Color(0xFFEFD8D8), "Light Pink"),
    ColorOption(Color(0xFFDCDCDC), "Gray"),
    ColorOption(Color(0xFFE6E6DC), "Light Beige"),
    ColorOption(Color(0xFFEFDCD8), "Light Peach"),
    ColorOption(Color(0xFFD8D8EF), "Light Purple 2"),
    ColorOption(Color(0xFFDCE6D8), "Light Mint"),
    ColorOption(Color(0xFFD8EFEF), "Light Cyan"),
    ColorOption(Color(0xFFEFD8DC), "Light Rose"),
    ColorOption(Color(0xFFE6E6D8), "Light Tan"),
    ColorOption(Color(0xFFD8DCEF), "Light Blue Gray"),
    ColorOption(Color(0xFFDCDCD8), "Light Olive"),
    ColorOption(Color(0xFFE6E6E6), "Light Silver"),
    ColorOption(Color(0xFFD8D8D8), "Light Gray 2"),
    ColorOption(Color(0xFFE0E0E0), "Silver"),
  ];
  
  void _selectColor(int index) {
    setState(() {
      selectedColorIndex = index;
    });
  }
  
  void _createRoom() {
    // Implementation for creating room
    debugPrint('Creating room with color: ${colorOptions[selectedColorIndex].name}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.backgroundColor,
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }
  
  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: AppStyles.backgroundColor,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: AppStyles.textPrimaryColor),
        onPressed: () {},
      ),
      title: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("- - ", style: TextStyle(color: AppStyles.textSecondaryColor)),
          Text("—", style: TextStyle(color: AppStyles.textPrimaryColor)),
        ],
      ),
      centerTitle: true,
    );
  }
  
  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          const SizedBox(height: 16),
          _buildHeader(),
          const SizedBox(height: 24),
          _buildAvatarPreview(),
          const SizedBox(height: 24),
          _buildColorGrid(),
          _buildCreateButton(),
        ],
      ),
    );
  }
  
  Widget _buildHeader() {
    return Column(
      children: const [
        Text("Room avatar", style: AppStyles.headingStyle),
        SizedBox(height: 8),
        Text(
          "Select the avatar background color",
          style: AppStyles.subheadingStyle,
        ),
      ],
    );
  }
  
  Widget _buildAvatarPreview() {
    return Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: colorOptions[selectedColorIndex].color,
      ),
      child: Center(
        child: ClipOval(
          child: SizedBox(
            width: 180,
            height: 180,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Container(color: colorOptions[selectedColorIndex].color),
                Image.network(
                  'https://i.ibb.co/GVt9vfg/group-avatar.png',
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  
  Widget _buildColorGrid() {
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 6,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemCount: colorOptions.length,
        itemBuilder: (context, index) {
          final isSelected = index == selectedColorIndex;
          
          return GestureDetector(
            onTap: () => _selectColor(index),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: colorOptions[index].color,
                border: isSelected
                  ? Border.all(color: Colors.black, width: 2)
                  : null,
              ),
            ),
          );
        },
      ),
    );
  }
  
  Widget _buildCreateButton() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32.0),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: _createRoom,
          style: AppStyles.primaryButtonStyle,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.star, size: 16),
              SizedBox(width: 8),
              Text("Create room", style: AppStyles.buttonTextStyle),
            ],
          ),
        ),
      ),
    );
  }
}

class ColorOption {
  final Color color;
  final String name;
  
  const ColorOption(this.color, this.name);
}