import 'package:flutter/material.dart';
import 'package:ping_me/service/auth_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  void LogOut() {
    final _auth = AuthService();
    _auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('home')),
      floatingActionButton: IconButton(
        onPressed: LogOut,
        icon: Icon(Icons.logout),
      ),
    );
  }
}
