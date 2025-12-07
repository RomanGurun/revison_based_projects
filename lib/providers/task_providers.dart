// ============================================================================
// FILE 3: lib/providers/task_providers.dart
// Copy this entire file into: lib/providers/task_providers.dart
// ============================================================================

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/task_model.dart';
import '../repositories/task_repositories.dart';

final taskRepositoryProvider = Provider<TaskRepository>((ref) {
  print("Provider : Creating TaskRepository");
  return TaskRepository();
});

class TasksState {
  final List<Task> tasks;
  final bool isLoading;
  final String? error;

  TasksState({required this.tasks, this.isLoading = false, this.error});

  TasksState copyWith({List<Task>? tasks, bool? isLoading, String? error}) {
    return TasksState(
      tasks: tasks ?? this.tasks,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }

  List<Task> get pendingTasks =>
      tasks.where((task) => task.status == 'P').toList();

  List<Task> get completedTasks =>
      tasks.where((task) => task.status == 'C').toList();
}

class TasksNotifier extends StateNotifier<TasksState> {
  final TaskRepository _repository;

  TasksNotifier(this._repository) : super(TasksState(tasks: [])) {
    loadTasks();
  }

  Future<void> loadTasks() async {
    state = state.copyWith(isLoading: true);
    try {
      final tasks = await _repository.fetchAllTasks();
      state = TasksState(tasks: tasks, isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> createTask(String title, String description) async {
    try {
      final newTask = await _repository.createTask(title, description);
      state = state.copyWith(tasks: [...state.tasks, newTask]);
    } catch (e) {
      state = state.copyWith(error: e.toString());
      rethrow;
    }
  }

  Future<void> completeTask(String taskId) async {
    final updatedTasks = state.tasks.map((task) {
      if (task.ids == taskId) {
        return task.copyWith(status: 'C');
      }
      return task;
    }).toList();

    state = state.copyWith(tasks: updatedTasks);

    try {
      await _repository.completeTask(taskId);
    } catch (e) {
      await loadTasks();
      rethrow;
    }
  }

  Future<void> deleteTask(String taskId) async {
    final updatedTasks = state.tasks
        .where((task) => task.ids != taskId)
        .toList();
    state = state.copyWith(tasks: updatedTasks);

    try {
      await _repository.deleteTask(taskId);
    } catch (e) {
      await loadTasks();
      rethrow;
    }
  }
}

final tasksProvider = StateNotifierProvider<TasksNotifier, TasksState>((ref) {
  final repository = ref.watch(taskRepositoryProvider);
  return TasksNotifier(repository);
});