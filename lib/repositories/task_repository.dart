
// ============================================================================
// FILE 2: lib/repositories/task_repository.dart
// Copy this entire file into: lib/repositories/task_repository.dart
// ============================================================================

import '../models/task_model.dart';

class TaskRepository {
  List<Task> _tasks = [
    Task(
      ids: '1',
      title: 'Learn Flutter',
      description: 'Study Widgets',
      status: 'P',
    ),
    Task(
      ids: '2',
      title: 'Build App',
      description: 'Create todo app',
      status: 'C',
    ),
  ];

  Future<List<Task>> fetchAllTasks() async {
    await Future.delayed(Duration(milliseconds: 300));
    print("Repository: Fetching all the tasks");
    return List.from(_tasks);
  }

  Future<List<Task>> fetchPendingTasks() async {
    await Future.delayed(Duration(milliseconds: 300));
    print("Repository Fetching PENDING tasks");
    return _tasks.where((tasks) => tasks.status == 'P').toList();
  }

  Future<List<Task>> fetchCompletedTasks() async {
    await Future.delayed(Duration(milliseconds: 300));
    print("Repository : Fetching completed tasks");
    return _tasks.where((tasks) => tasks.status == 'C').toList();
  }

  Future<Task> createTask(String title, String description) async {
    await Future.delayed(Duration(milliseconds: 300));
    print("Repository : Creating new task");
    final newTask = Task(
      ids: DateTime.now().millisecondsSinceEpoch.toString(),
      title: title,
      description: description,
      status: 'P',
    );

    _tasks.add(newTask);
    return newTask;
  }

  Future<void> completeTask(String taskId) async {
    await Future.delayed(Duration(milliseconds: 300));
    print("Repository: Completed Tasks : $taskId");

    final index = _tasks.indexWhere((t) => t.ids == taskId);
    if (index != -1) {
      _tasks[index] = _tasks[index].copyWith(status: 'C');
    }
  }

  Future<void> deleteTask(String taskId) async {
    await Future.delayed(Duration(milliseconds: 300));
    print("Repository : Deleting Tasks : $taskId");
    _tasks.removeWhere((t) => t.ids == taskId);
  }
}