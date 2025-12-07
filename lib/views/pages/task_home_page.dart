// ============================================================================
// FILE 8: lib/views/pages/task_home_page.dart
// Copy this entire file into: lib/views/pages/task_home_page.dart
// ============================================================================

import 'package:flutter/material.dart';
import '../../pending_task_page.dart';
import '../../completed_task_page.dart';
import '../../create_task_page.dart';

class TaskHomePage extends StatelessWidget {
  const TaskHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Task Manager'),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          bottom: const TabBar(
            labelColor: Colors.red,
            unselectedLabelColor: Colors.black,
            indicatorColor: Colors.yellow,
            tabs: [
              Tab(icon: Icon(Icons.pending_actions), text: 'Operating'),
              Tab(icon: Icon(Icons.check_circle), text: 'Finished'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [PendingTaskPage(), CompletedTaskPage()],
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CreateTaskPage()),
            );
          },
          icon: const Icon(Icons.upload),
          label: const Text('New Task'),
          backgroundColor: Colors.blue,
        ),
      ),
    );
  }
}
