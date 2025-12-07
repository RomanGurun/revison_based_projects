// Copy this entire file into: lib/views/pages/pending_task_page.dart
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/task_providers.dart';
import '../widgets/task_card.dart';

class PendingTaskPage extends ConsumerWidget {
  const PendingTaskPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final taskState = ref.watch(tasksProvider);

    if (taskState.isLoading && taskState.tasks.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    if (taskState.error != null && taskState.tasks.isEmpty) {
      return Center(
        child: Text(
          'Error: ${taskState.error}',
          style: const TextStyle(color: Colors.red),
        ),
      );
    }

    final pendingTasks = taskState.pendingTasks;

    if (pendingTasks.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.inbox, size: 80, color: Colors.grey),
            SizedBox(height: 16),
            Text(
              'No Pending Tasks',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: pendingTasks.length,
      itemBuilder: (context, index) {
        final task = pendingTasks[index];
        return TaskCard(task: task, isPending: true, key: ValueKey(task.ids));
      },
    );
  }
}