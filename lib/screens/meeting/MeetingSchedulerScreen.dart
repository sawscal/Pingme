import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ping_me/widgets/buildAccessControlTab.dart';
import 'package:ping_me/widgets/buildSchedulingTab.dart';
import 'package:ping_me/widgets/buildTimeSelectors.dart';

class _MeetingSchedulerScreenState extends State<MeetingSchedulerScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final _formKey = GlobalKey<FormState>();

  // These must also be declared if used in `_scheduleMeeting`
  final TextEditingController _titleController = TextEditingController();
  final List<String> _participants = [];
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meeting Scheduler'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Schedule Meeting'),
            Tab(text: 'Access Control'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          SchedulingTab(formKey: _formKey, titleController: _titleController),
          buildAccessControlTab(),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        icon: const Icon(Icons.check),
        label: const Text('Schedule Meeting'),
      ),
    );
  }
}


