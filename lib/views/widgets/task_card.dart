// Copy this entire file into: lib/views/widgets/task_card.dart
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/task_model.dart';
import '../../providers/task_providers.dart';

class TaskCard extends ConsumerWidget {
  const TaskCard({super.key, required this.task, required this.isPending});
  final Task task;
  final bool isPending;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 2,
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: CircleAvatar(
          backgroundColor: isPending ? Colors.orange : Colors.green,
          child: Icon(
            isPending ? Icons.pending_actions : Icons.check_circle,
            color: Colors.white,
          ),
        ),
        title: Text(
          task.title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            decoration: isPending ? null : TextDecoration.lineThrough,
          ),
        ),
        subtitle: Padding(
          padding: EdgeInsets.only(top: 8),
          child: Text(task.description),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isPending)
              IconButton(
                icon: const Icon(Icons.check, color: Colors.green),
                onPressed: () => _completeTask(context, ref, task.ids),
                tooltip: 'Mark as Finished',
              ),
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () => _deleteTask(context, ref, task.ids),
              tooltip: 'Delete task',
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _completeTask(
      BuildContext context,
      WidgetRef ref,
      String taskId,
      ) async {
    try {
      await ref.read(tasksProvider.notifier).completeTask(taskId);
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Task Completed!"),
            backgroundColor: Colors.green,
            duration: Duration(seconds: 2),
          ),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Error: $e"),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Future<void> _deleteTask(
      BuildContext context,
      WidgetRef ref,
      String taskId,
      ) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text("Delete Task"),
          content: const Text(
              "Are you sure you want to delete this task? This action cannot be undone."),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(false),
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(true),
              style: TextButton.styleFrom(foregroundColor: Colors.red),
              child: const Text("Delete"),
            ),
          ],
        );
      },
    );

    if (confirmed == true) {
      try {
        await ref.read(tasksProvider.notifier).deleteTask(taskId);
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Task Deleted Successfully"),
              backgroundColor: Colors.red,
              duration: Duration(seconds: 2),
            ),
          );
        }
      } catch (e) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Error: $e"),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    }
  }
}