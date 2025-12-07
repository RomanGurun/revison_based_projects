// ============================================================================
// FILE 6: lib/views/pages/completed_task_page.dart
// Copy this entire file into: lib/views/pages/completed_task_page.dart
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/task_providers.dart';
import '../widgets/task_card.dart';

class CompletedTaskPage extends ConsumerWidget {
  const CompletedTaskPage({super.key});

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

    final completedTasks = taskState.completedTasks;

    if (completedTasks.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.check_circle_outline, size: 80, color: Colors.grey),
            SizedBox(height: 16),
            Text(
              'No Completed Tasks',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            SizedBox(height: 8),
            Text(
              'Complete some tasks to see them here!',
              style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: completedTasks.length,
      itemBuilder: (context, index) {
        final task = completedTasks[index];
        return TaskCard(task: task, isPending: false, key: ValueKey(task.ids));
      },
    );
  }
}
