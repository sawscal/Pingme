import 'package:flutter/material.dart';
import 'package:ping_me/widgets/buildActivityTab.dart';
import 'package:google_fonts/google_fonts.dart';


class MainNavigationScreen extends StatefulWidget {
  @override
  _MainNavigationScreenState createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    DashboardScreen(),
    OrganizationScreen(),
    UserProfileScreen(),
    AdminPanelScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    // Responsive layout handling
    final bool isDesktop = MediaQuery.of(context).size.width > 1100;
    final bool isTablet =
        MediaQuery.of(context).size.width > 650 &&
        MediaQuery.of(context).size.width <= 1100;

    return Scaffold(
      body: Row(
        children: [
          // Navigation rail for tablet and desktop
          if (isTablet || isDesktop)
            NavigationRail(
              extended: isDesktop,
              destinations: [
                NavigationRailDestination(
                  icon: Icon(Icons.dashboard),
                  label: Text('Dashboard'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.business),
                  label: Text('Organization'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.person),
                  label: Text('Profile'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.admin_panel_settings),
                  label: Text('Admin'),
                ),
              ],
              selectedIndex: _selectedIndex,
              onDestinationSelected: (int index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          // Main content area
          Expanded(child: _screens[_selectedIndex]),
        ],
      ),
      // Bottom navigation for mobile
      bottomNavigationBar:
          isTablet || isDesktop
              ? null
              : BottomNavigationBar(
                currentIndex: _selectedIndex,
                onTap: (int index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                type: BottomNavigationBarType.fixed,
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.dashboard),
                    label: 'Dashboard',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.business),
                    label: 'Organization',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label: 'Profile',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.admin_panel_settings),
                    label: 'Admin',
                  ),
                ],
              ),
    );
  }
}

// User Profile Screen
class UserProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User Profile')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: LayoutBuilder(
            builder: (context, constraints) {
              // Responsive layout
              if (constraints.maxWidth > 600) {
                // Desktop/Tablet layout
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: 1, child: _buildProfileCard(context)),
                    SizedBox(width: 16),
                    Expanded(flex: 2, child: _buildProfileDetails(context)),
                  ],
                );
              } else {
                // Mobile layout
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildProfileCard(context),
                    SizedBox(height: 16),
                    _buildProfileDetails(context),
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildProfileCard(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                'https://picsum.photos/id/1/200/200',
              ),
            ),
            SizedBox(height: 16),
            Text('Sarah Johnson',            style: GoogleFonts.lato(
    textStyle: TextStyle(color: Colors.black, letterSpacing: .5),
  ),),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Product Designer'),
                SizedBox(width: 8),
                Tooltip(
                  message: 'Blockchain Verified',
                  child: Icon(Icons.verified, color: Colors.blue),
                ),
              ],
            ),
            Text('Acme Corporation'),
            SizedBox(height: 8),
            Chip(
              avatar: Icon(Icons.stars, size: 18),
              label: Text('Verified'),
              backgroundColor: Colors.green.withOpacity(0.2),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileDetails(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Details',            style: GoogleFonts.lato(
    textStyle: TextStyle(color: Colors.black, letterSpacing: .5),
  ),),
            Divider(),
            ListTile(
              leading: Icon(Icons.email),
              title: Text('Email'),
              subtitle: Text('sarah.johnson@acme.com'),
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('Phone'),
              subtitle: Text('+1 (555) 123-4567'),
            ),
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text('Location'),
              subtitle: Text('San Francisco, CA'),
            ),
            SizedBox(height: 16),
            Text('Bio',            style: GoogleFonts.lato(
    textStyle: TextStyle(color: Colors.black, letterSpacing: .5),
  ),),
            Divider(),
            Text(
              'Product designer with 7+ years of experience. Passionate about creating intuitive user experiences and solving complex design challenges. Blockchain enthusiast.',
                        style: GoogleFonts.lato(
    textStyle: TextStyle(color: Colors.black, letterSpacing: .5),
  ),
            ),
            SizedBox(height: 16),
            Text(
              'Blockchain Verification',
                       style: GoogleFonts.lato(
    textStyle: TextStyle(color: Colors.black, letterSpacing: .5),
  ),
            ),
            Divider(),
            Row(
              children: [
                Icon(Icons.security, color: Colors.green),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Identity verified on Ethereum: 0x1a2...3b4c',
                              style: GoogleFonts.lato(
    textStyle: TextStyle(color: Colors.black, letterSpacing: .5),
  ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.access_time, color: Colors.blue),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Last verification: May 1, 2025',
                              style: GoogleFonts.lato(
    textStyle: TextStyle(color: Colors.black, letterSpacing: .5),
  ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Organization Screen
class OrganizationScreen extends StatefulWidget {
  @override
  _OrganizationScreenState createState() => _OrganizationScreenState();
}

class _OrganizationScreenState extends State<OrganizationScreen> {
  String _selectedChannel = 'All';
  final List<String> _channels = [
    'All',
    '#design',
    '#backend',
    '#frontend',
    '#marketing',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Organization')),
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Responsive layout
          if (constraints.maxWidth > 800) {
            // Desktop layout - side by side
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Channels sidebar
                Container(width: 250, child: _buildChannelsList()),
                // Organization content
                Expanded(child: _buildOrganizationContent()),
              ],
            );
          } else {
            // Mobile/Tablet layout - stacked
            return Column(
              children: [
                // Channels dropdown
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: DropdownButton<String>(
                    isExpanded: true,
                    value: _selectedChannel,
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        setState(() {
                          _selectedChannel = newValue;
                        });
                      }
                    },
                    items:
                        _channels.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                  ),
                ),
                // Organization content
                Expanded(child: _buildOrganizationContent()),
              ],
            );
          }
        },
      ),
    );
  }

  Widget _buildChannelsList() {
    return Card(
      margin: EdgeInsets.all(16),
      child: ListView(
        padding: EdgeInsets.all(8),
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Channels',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Divider(),
          ..._channels.map(
            (channel) => ListTile(
              leading: channel == 'All' ? Icon(Icons.group) : Icon(Icons.tag),
              title: Text(channel),
              selected: _selectedChannel == channel,
              onTap: () {
                setState(() {
                  _selectedChannel = channel;
                });
              },
            ),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.add_circle_outline),
            title: Text('Create Channel'),
            onTap: () {
              // Show create channel dialog
            },
          ),
        ],
      ),
    );
  }

  Widget _buildOrganizationContent() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Organization header
          Card(
            elevation: 4,
            child: Padding(
              padding:  EdgeInsets.all(16.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                      'https://picsum.photos/id/20/200/200',
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Acme Corporation',
                                    style: GoogleFonts.lato(
    textStyle: TextStyle(color: Colors.black, letterSpacing: .5),
  ),
                        ),
                        Text(
                          'Software Development',
                                     style: GoogleFonts.lato(
    textStyle: TextStyle(color: Colors.black, letterSpacing: .5),
  ),
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(Icons.verified, color: Colors.blue, size: 16),
                            SizedBox(width: 4),
                            Text(
                              'Blockchain Verified Organization',
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 16),
          // Channel title
          Text(
            _selectedChannel == 'All' ? 'All Members' : _selectedChannel,
                       style: GoogleFonts.lato(
    textStyle: TextStyle(color: Colors.black, letterSpacing: .5),
  ),
          ),
          SizedBox(height: 8),
          // Members grid
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 300,
              childAspectRatio: 0.8,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemCount: 6, // Demo data
            itemBuilder: (context, index) {
              return _buildMemberCard(context, index);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildMemberCard(BuildContext context, int index) {
    // Demo data
    final List<Map<String, dynamic>> members = [
      {
        'name': 'John Smith',
        'role': 'Lead Developer',
        'channel': '#backend',
        'image': 'https://picsum.photos/id/1002/200/200',
      },
      {
        'name': 'Sarah Johnson',
        'role': 'Product Designer',
        'channel': '#design',
        'image': 'https://picsum.photos/id/1/200/200',
      },
      {
        'name': 'Michael Wong',
        'role': 'Frontend Engineer',
        'channel': '#frontend',
        'image': 'https://picsum.photos/id/1003/200/200',
      },
      {
        'name': 'Lisa Chen',
        'role': 'Backend Engineer',
        'channel': '#backend',
        'image': 'https://picsum.photos/id/1005/200/200',
      },
      {
        'name': 'David Park',
        'role': 'UI Designer',
        'channel': '#design',
        'image': 'https://picsum.photos/id/1012/200/200',
      },
      {
        'name': 'Emma Wilson',
        'role': 'Marketing Lead',
        'channel': '#marketing',
        'image': 'https://picsum.photos/id/1027/200/200',
      },
    ];

    // Filter by selected channel
    if (_selectedChannel != 'All' &&
        members[index]['channel'] != _selectedChannel) {
      return Container(); // Don't show if not in the selected channel
    }

    return Card(
      elevation: 2,
      child: InkWell(
        onTap: () {
          // Navigate to user profile
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => UserProfileScreen()),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(members[index]['image']),
              ),
            ),
            Text(
              members[index]['name'],
             style: GoogleFonts.lato(
    textStyle: TextStyle(color: Colors.black, letterSpacing: .5),
  ) ?.copyWith(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4),
            Text(
              members[index]['role'],
                         style: GoogleFonts.lato(
    textStyle: TextStyle(color: Colors.black, letterSpacing: .5),
  ),
            ),
            Chip(
              label: Text(members[index]['channel']),
              backgroundColor: _getChannelColor(members[index]['channel']),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(Icons.email),
                    onPressed: () {},
                    tooltip: 'Send Message',
                  ),
                  IconButton(
                    icon: Icon(Icons.info_outline),
                    onPressed: () {
                      // Show user details
                    },
                    tooltip: 'View Details',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getChannelColor(String channel) {
    switch (channel) {
      case '#design':
        return Colors.purple.withOpacity(0.2);
      case '#backend':
        return Colors.blue.withOpacity(0.2);
      case '#frontend':
        return Colors.orange.withOpacity(0.2);
      case '#marketing':
        return Colors.green.withOpacity(0.2);
      default:
        return Colors.grey.withOpacity(0.2);
    }
  }
}

// Dashboard Screen
class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dashboard')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome, Sarah!',
                          style: GoogleFonts.lato(
    textStyle: TextStyle(color: Colors.black, letterSpacing: .5),
  ),
              ),
              SizedBox(height: 24),
              _buildDashboardGrid(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDashboardGrid(BuildContext context) {
    // Responsive grid layout
    return LayoutBuilder(
      builder: (context, constraints) {
        int crossAxisCount = 1;
        if (constraints.maxWidth > 1100) {
          crossAxisCount = 3;
        } else if (constraints.maxWidth > 650) {
          crossAxisCount = 2;
        }

        return GridView.count(
          crossAxisCount: crossAxisCount,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          children: [
            _buildStatsCard(
              context,
              'My Organization',
              'Acme Corporation',
              Icons.business,
              Colors.blue,
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OrganizationScreen()),
                );
              },
            ),
            _buildStatsCard(
              context,
              'My Team',
              '#design - 8 members',
              Icons.group,
              Colors.purple,
              () {},
            ),
            _buildStatsCard(
              context,
              'Blockchain Status',
              'Verified ✓',
              Icons.verified,
              Colors.green,
              () {},
            ),
            _buildStatsCard(
              context,
              'Recent Activity',
              '12 new updates',
              Icons.update,
              Colors.orange,
              () {},
            ),
            _buildStatsCard(
              context,
              'Admin Access',
              'Organization Manager',
              Icons.admin_panel_settings,
              Colors.red,
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AdminPanelScreen()),
                );
              },
            ),
            _buildStatsCard(
              context,
              'Messages',
              '3 unread messages',
              Icons.message,
              Colors.teal,
              () {},
            ),
          ],
        );
      },
    );
  }

  Widget _buildStatsCard(
    BuildContext context,
    String title,
    String value,
    IconData icon,
    Color color,
    VoidCallback onTap,
  ) {
    return Card(
      elevation: 4,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 48, color: color),
              SizedBox(height: 16),
              Text(
                title,
                           style: GoogleFonts.lato(
    textStyle: TextStyle(color: Colors.black, letterSpacing: .5),
  ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8),
              Text(
                value,
               style: GoogleFonts.lato(
    textStyle: TextStyle(color: Colors.black, letterSpacing: .5),
  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Admin Panel Screen
class AdminPanelScreen extends StatefulWidget {
  @override
  _AdminPanelScreenState createState() => _AdminPanelScreenState();
}

class _AdminPanelScreenState extends State<AdminPanelScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Panel'),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Users'),
            Tab(text: 'Activity'),
            Tab(text: 'Settings'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [_buildUsersTab(), buildActivityTab(), _buildSettingsTab()],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _showAddUserDialog(context);
        },
      ),
    );
  }

  Widget _buildUsersTab() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Organization Users',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          // Search and filter bar
          TextField(
            decoration: InputDecoration(
              labelText: 'Search users',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          SizedBox(height: 16),
          // Users list
          Expanded(
            child: Card(
              elevation: 4,
              child: ListView.separated(
                itemCount: 6,
                separatorBuilder: (context, index) => Divider(),
                itemBuilder: (context, index) {
                  // Demo data
                  final List<Map<String, dynamic>> users = [
                    {
                      'name': 'John Smith',
                      'role': 'Lead Developer',
                      'status': true,
                      'image': 'https://picsum.photos/id/1002/200/200',
                      'adminLevel': 'Admin',
                    },
                  ];

//               return ListTile(
//   leading: CircleAvatar(
//     backgroundColor: Theme.of(context).primaryColor.withOpacity(0.2),
//     child: Icon(
//       activities[index]['icon'],
//       color: Theme.of(context).primaryColor,
//     ),
//   ),
//   title: Text(
//     activities[index]['action'],
//     style: TextStyle(fontWeight: FontWeight.w600),
//   ),
//   subtitle: Text(
//     'By ${activities[index]['user']} • ${activities[index]['time']}',
//     style: TextStyle(color: Colors.grey[600]),
//   ),
//   trailing: Text(
//     activities[index]['date'],
//     style: TextStyle(color: Colors.grey[700]),
//   ),
// );

                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsTab() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Organization Settings',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          Expanded(
            child: ListView(
              children: [
                // Organization Profile Section
                Card(
                  elevation: 2,
                  margin: EdgeInsets.only(bottom: 16),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Organization Profile',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Divider(),
                        ListTile(
                          title: Text('Organization Name'),
                          subtitle: Text('Acme Corporation'),
                          trailing: IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () {},
                          ),
                        ),
                        ListTile(
                          title: Text('Website'),
                          subtitle: Text('www.acmecorp.com'),
                          trailing: IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () {},
                          ),
                        ),
                        ListTile(
                          title: Text('Industry'),
                          subtitle: Text('Software Development'),
                          trailing: IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () {},
                          ),
                        ),
                        ListTile(
                          title: Text('Logo'),
                          subtitle: Text('Upload or change organization logo'),
                          trailing: IconButton(
                            icon: Icon(Icons.upload),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Blockchain Verification Section
                Card(
                  elevation: 2,
                  margin: EdgeInsets.only(bottom: 16),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Blockchain Verification',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Divider(),
                        ListTile(
                          title: Text('Verification Status'),
                          subtitle: Text('Active'),
                          trailing: Chip(
                            label: Text('Verified'),
                            backgroundColor: Colors.green.withOpacity(0.2),
                          ),
                        ),
                        ListTile(
                          title: Text('Blockchain Address'),
                          subtitle: Text('0x743a...8b29c'),
                          trailing: IconButton(
                            icon: Icon(Icons.copy),
                            onPressed: () {},
                          ),
                        ),
                        ListTile(
                          title: Text('Last Verification'),
                          subtitle: Text('May 1, 2025'),
                        ),
                        SizedBox(height: 8),
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.refresh),
                          label: Text('Renew Verification'),
                        ),
                      ],
                    ),
                  ),
                ),

                // Channels and Teams Section
                Card(
                  elevation: 2,
                  margin: EdgeInsets.only(bottom: 16),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Channels and Teams',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Divider(),
                        ListTile(
                          title: Text('#design'),
                          subtitle: Text('8 members'),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: Icon(Icons.edit),
                                onPressed: () {},
                              ),
                              IconButton(
                                icon: Icon(Icons.delete_outline),
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ),
                        ListTile(
                          title: Text('#backend'),
                          subtitle: Text('6 members'),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: Icon(Icons.edit),
                                onPressed: () {},
                              ),
                              IconButton(
                                icon: Icon(Icons.delete_outline),
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ),
                        ListTile(
                          title: Text('#frontend'),
                          subtitle: Text('5 members'),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: Icon(Icons.edit),
                                onPressed: () {},
                              ),
                              IconButton(
                                icon: Icon(Icons.delete_outline),
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ),
                        ListTile(
                          title: Text('#marketing'),
                          subtitle: Text('3 members'),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: Icon(Icons.edit),
                                onPressed: () {},
                              ),
                              IconButton(
                                icon: Icon(Icons.delete_outline),
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 8),
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.add),
                          label: Text('Add New Channel'),
                        ),
                      ],
                    ),
                  ),
                ),

                // Advanced Settings Section
                Card(
                  elevation: 2,
                  margin: EdgeInsets.only(bottom: 16),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Advanced Settings',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Divider(),
                        SwitchListTile(
                          title: Text('Enable 2FA for All Members'),
                          subtitle: Text(
                            'Require two-factor authentication for all organization members',
                          ),
                          value: true,
                          onChanged: (value) {},
                        ),
                        SwitchListTile(
                          title: Text('Require Blockchain Verification'),
                          subtitle: Text(
                            'All members must complete blockchain verification',
                          ),
                          value: true,
                          onChanged: (value) {},
                        ),
                        SwitchListTile(
                          title: Text('Public Organization Profile'),
                          subtitle: Text(
                            'Make organization profile visible to non-members',
                          ),
                          value: false,
                          onChanged: (value) {},
                        ),
                        SwitchListTile(
                          title: Text('Auto-approve New Members'),
                          subtitle: Text(
                            'Automatically approve member requests',
                          ),
                          value: false,
                          onChanged: (value) {},
                        ),
                      ],
                    ),
                  ),
                ),

                // Danger Zone
                Card(
                  elevation: 2,
                  color: Colors.red.shade50,
                  margin: EdgeInsets.only(bottom: 16),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Danger Zone',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                        Divider(color: Colors.red.shade200),
                        ListTile(
                          title: Text('Transfer Ownership'),
                          subtitle: Text(
                            'Transfer organization ownership to another member',
                          ),
                          trailing: TextButton(
                            child: Text('Transfer'),
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.red,
                            ),
                          ),
                        ),
                        ListTile(
                          title: Text('Delete Organization'),
                          subtitle: Text(
                            'Permanently delete this organization and all its data',
                          ),
                          trailing: TextButton(
                            child: Text('Delete'),
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.red,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showAddUserDialog(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text('Add New User'),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 16),
                  DropdownButtonFormField(
                    decoration: InputDecoration(
                      labelText: 'Role',
                      border: OutlineInputBorder(),
                    ),
                    items: [
                      DropdownMenuItem(value: 'member', child: Text('Member')),
                      DropdownMenuItem(value: 'admin', child: Text('Admin')),
                      DropdownMenuItem(value: 'owner', child: Text('Owner')),
                    ],
                    onChanged: (value) {},
                  ),
                  SizedBox(height: 16),
                  DropdownButtonFormField(
                    decoration: InputDecoration(
                      labelText: 'Channel',
                      border: OutlineInputBorder(),
                    ),
                    items: [
                      DropdownMenuItem(value: 'design', child: Text('#design')),
                      DropdownMenuItem(
                        value: 'backend',
                        child: Text('#backend'),
                      ),
                      DropdownMenuItem(
                        value: 'frontend',
                        child: Text('#frontend'),
                      ),
                      DropdownMenuItem(
                        value: 'marketing',
                        child: Text('#marketing'),
                      ),
                    ],
                    onChanged: (value) {},
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Add User'),
              ),
            ],
          ),
    );
  }

  Color _getAdminLevelColor(String level) {
    switch (level) {
      case 'Owner':
        return Colors.purple.withOpacity(0.2);
      case 'Admin':
        return Colors.blue.withOpacity(0.2);
      case 'Member':
        return Colors.green.withOpacity(0.2);
      default:
        return Colors.grey.withOpacity(0.2);
    }
  }
}
