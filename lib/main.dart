
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


// ============================================
// STEP 1: THE MODEL (Data Structure)
// ============================================
// Think of this as a "blueprint" for a task
// Just like Product has name, price, etc., Task has title, status, etc.

class Task {
  final String id;           // Unique identifier (like product ID)
  final String title;        // Task name
  final String description;  // Task details
  final String status;       // 'P' = pending, 'C' = completed

  Task({
    required this.id,
    required this.title,
    required this.description,
    required this.status,
  });

  // This converts JSON (from API) into a Task object
  // Think: API gives us raw data, we convert it to something Flutter understands
  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'].toString(),
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      status: json['status'] ?? 'P',  // Default is 'P' (pending)
    );
  }

  // This converts Task object to JSON (to send to API)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'status': status,
    };
  }
}

// ============================================
// STEP 2: THE REPOSITORY (Talks to Backend/Database)
// ============================================
// This is like a messenger between your app and the server
// Your project uses Dio to talk to API, here we'll simulate it

class TaskRepository {
  // Fake database - In real app, this would be API calls
  List<Task> _tasks = [
    Task(id: '1', title: 'Learn Flutter', description: 'Study widgets', status: 'P'),
    Task(id: '2', title: 'Build App', description: 'Create todo app', status: 'P'),
    Task(id: '3', title: 'Deploy App', description: 'Publish to store', status: 'C'),
  ];

  // Fetch all tasks (like fetchMyProducts)
  Future<List<Task>> fetchAllTasks() async {
    await Future.delayed(Duration(seconds: 1)); // Simulate network delay
    print('📦 REPOSITORY: Fetching all tasks');
    return _tasks;
  }

  // Fetch only pending tasks (like your filtered My Products)
  Future<List<Task>> fetchPendingTasks() async {
    await Future.delayed(Duration(seconds: 1));
    print('📦 REPOSITORY: Fetching PENDING tasks');
    return _tasks.where((task) => task.status == 'P').toList();
  }

  // Fetch only completed tasks (like marketplace products)
  Future<List<Task>> fetchCompletedTasks() async {
    await Future.delayed(Duration(seconds: 1));
    print('📦 REPOSITORY: Fetching COMPLETED tasks');
    return _tasks.where((task) => task.status == 'C').toList();
  }

  // Create a new task (like createProduct)
  Future<Task> createTask(String title, String description) async {
    await Future.delayed(Duration(seconds: 1));
    print('📦 REPOSITORY: Creating new task');

    final newTask = Task(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: title,
      description: description,
      status: 'P', // New tasks start as pending
    );

    _tasks.add(newTask);
    return newTask;
  }

  // Mark task as complete (like uploadProductToMarketplace)
  Future<void> completeTask(String taskId) async {
    await Future.delayed(Duration(seconds: 1));
    print('📦 REPOSITORY: Completing task $taskId');

    final index = _tasks.indexWhere((t) => t.id == taskId);
    if (index != -1) {
      _tasks[index] = Task(
        id: _tasks[index].id,
        title: _tasks[index].title,
        description: _tasks[index].description,
        status: 'C', // Change status to completed
      );
    }
  }

  // Delete a task (like deleteProduct)
  Future<void> deleteTask(String taskId) async {
    await Future.delayed(Duration(seconds: 1));
    print('📦 REPOSITORY: Deleting task $taskId');
    _tasks.removeWhere((task) => task.id == taskId);
  }
}

// ============================================
// STEP 3: PROVIDERS (State Management with Riverpod)
// ============================================
// Providers are like "watchers" - they watch data and update UI automatically
// When data changes, UI rebuilds automatically!


// 1. Repository Provider - Creates one instance of repository
// This is like a singleton - only one repository for entire app
final taskRepositoryProvider = Provider<TaskRepository>((ref) {
  print('🏗️ PROVIDER: Creating TaskRepository');
  return TaskRepository();
});

// 2. Pending Tasks Provider - Fetches pending tasks
// FutureProvider is for async data (data that takes time to load)
final pendingTasksProvider = FutureProvider.autoDispose<List<Task>>((ref) async {
  print('🔄 PROVIDER: Fetching pending tasks');
  final repository = ref.watch(taskRepositoryProvider);
  return repository.fetchPendingTasks();
});

// 3. Completed Tasks Provider - Fetches completed tasks
final completedTasksProvider = FutureProvider.autoDispose<List<Task>>((ref) async {
  print('🔄 PROVIDER: Fetching completed tasks');
  final repository = ref.watch(taskRepositoryProvider);
  return repository.fetchCompletedTasks();
});

// 4. Task Action State - For handling actions like create, complete, delete
enum TaskActionStatus { initial, loading, success, error }

class TaskActionState {
  final TaskActionStatus status;
  final String? errorMessage;
  final String? actionType; // 'create', 'complete', 'delete'

  const TaskActionState({
    this.status = TaskActionStatus.initial,
    this.errorMessage,
    this.actionType,
  });
}

// 5. Task Action Notifier - Handles creating, completing, deleting tasks
class TaskActionNotifier extends StateNotifier<TaskActionState> {
  final Ref _ref;

  TaskActionNotifier(this._ref) : super(const TaskActionState());

  Future<void> createTask(String title, String description) async {
    print('⚡ ACTION: Creating task');
    state = const TaskActionState(status: TaskActionStatus.loading);

    try {
      await _ref.read(taskRepositoryProvider).createTask(title, description);
      state = const TaskActionState(
        status: TaskActionStatus.success,
        actionType: 'create',
      );

      // Refresh the lists
      _ref.invalidate(pendingTasksProvider);
      _ref.invalidate(completedTasksProvider);
    } catch (e) {
      state = TaskActionState(
        status: TaskActionStatus.error,
        errorMessage: e.toString(),
      );
    }
  }

  Future<void> completeTask(String taskId) async {
    print('⚡ ACTION: Completing task');
    state = const TaskActionState(status: TaskActionStatus.loading);

    try {
      await _ref.read(taskRepositoryProvider).completeTask(taskId);
      state = const TaskActionState(
        status: TaskActionStatus.success,
        actionType: 'complete',
      );

      // Refresh both lists
      _ref.invalidate(pendingTasksProvider);
      _ref.invalidate(completedTasksProvider);
    } catch (e) {
      state = TaskActionState(
        status: TaskActionStatus.error,
        errorMessage: e.toString(),
      );
    }
  }

  Future<void> deleteTask(String taskId) async {
    print('⚡ ACTION: Deleting task');
    state = const TaskActionState(status: TaskActionStatus.loading);

    try {
      await _ref.read(taskRepositoryProvider).deleteTask(taskId);
      state = const TaskActionState(
        status: TaskActionStatus.success,
        actionType: 'delete',
      );

      _ref.invalidate(pendingTasksProvider);
      _ref.invalidate(completedTasksProvider);
    } catch (e) {
      state = TaskActionState(
        status: TaskActionStatus.error,
        errorMessage: e.toString(),
      );
    }
  }
}

// Provider for Task Actions
final taskActionProvider = StateNotifierProvider.autoDispose<TaskActionNotifier, TaskActionState>((ref) {
  print('🏗️ PROVIDER: Creating TaskActionNotifier');
  return TaskActionNotifier(ref);
});

// ============================================
// STEP 4: UI SCREENS
// ============================================


// Main App
class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(  // Riverpod needs this wrapper
      child: MaterialApp(
        title: 'Simple TODO',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const HomePage(),
      ),
    );
  }
}

// Home Page - Shows tabs for Pending and Completed
class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('My TODO App'),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.pending_actions), text: 'My Tasks'),
              Tab(icon: Icon(Icons.check_circle), text: 'Completed'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            PendingTasksTab(),
            CompletedTasksTab(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CreateTaskPage()),
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

// Pending Tasks Tab (Like "My Products")
class PendingTasksTab extends ConsumerWidget {
  const PendingTasksTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the provider - UI rebuilds when data changes!
    final tasksAsync = ref.watch(pendingTasksProvider);

    return tasksAsync.when(
      // When loading
      loading: () => const Center(child: CircularProgressIndicator()),

      // When error
      error: (error, stack) => Center(
        child: Text('Error: $error', style: TextStyle(color: Colors.red)),
      ),

      // When data loaded successfully
      data: (tasks) {
        if (tasks.isEmpty) {
          return const Center(child: Text('No pending tasks! 🎉'));
        }

        return ListView.builder(
          itemCount: tasks.length,
          padding: const EdgeInsets.all(16),
          itemBuilder: (context, index) {
            final task = tasks[index];
            return TaskCard(task: task, isPending: true);
          },
        );
      },
    );
  }
}

// Completed Tasks Tab (Like "Marketplace")
class CompletedTasksTab extends ConsumerWidget {
  const CompletedTasksTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasksAsync = ref.watch(completedTasksProvider);

    return tasksAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(child: Text('Error: $error')),
      data: (tasks) {
        if (tasks.isEmpty) {
          return const Center(child: Text('No completed tasks yet'));
        }

        return ListView.builder(
          itemCount: tasks.length,
          padding: const EdgeInsets.all(16),
          itemBuilder: (context, index) {
            final task = tasks[index];
            return TaskCard(task: task, isPending: false);
          },
        );
      },
    );
  }
}

// Task Card Widget
class TaskCard extends ConsumerWidget {
  final Task task;
  final bool isPending;

  const TaskCard({super.key, required this.task, required this.isPending});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        title: Text(
          task.title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            decoration: isPending ? null : TextDecoration.lineThrough,
          ),
        ),
        subtitle: Text(task.description),
        trailing: isPending
            ? IconButton(
          icon: const Icon(Icons.check_circle_outline, color: Colors.green),
          onPressed: () {
            // Complete the task
            ref.read(taskActionProvider.notifier).completeTask(task.id);

            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Task completed! ✅')),
            );
          },
        )
            : const Icon(Icons.check_circle, color: Colors.green),
      ),
    );
  }
}

// Create Task Page (Like AddProductPage)
class CreateTaskPage extends ConsumerStatefulWidget {
  const CreateTaskPage({super.key});

  @override
  ConsumerState<CreateTaskPage> createState() => _CreateTaskPageState();
}

class _CreateTaskPageState extends ConsumerState<CreateTaskPage> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Listen for action state changes
    ref.listen<TaskActionState>(taskActionProvider, (previous, next) {
      if (next.status == TaskActionStatus.success) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Task created! 🎉'), backgroundColor: Colors.green),
        );
        Navigator.pop(context);
      } else if (next.status == TaskActionStatus.error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: ${next.errorMessage}'), backgroundColor: Colors.red),
        );
      }
    });

    final actionState = ref.watch(taskActionProvider);
    final isLoading = actionState.status == TaskActionStatus.loading;

    return Scaffold(
      appBar: AppBar(title: const Text('Create New Task')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: 'Task Title',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(
                labelText: 'Description',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: isLoading
                    ? null
                    : () {
                  if (_titleController.text.trim().isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Please enter a title')),
                    );
                    return;
                  }

                  ref.read(taskActionProvider.notifier).createTask(
                    _titleController.text.trim(),
                    _descriptionController.text.trim(),
                  );
                },
                child: isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text('Create Task', style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================
// MAIN FUNCTION - Entry point
// ============================================
void main() {
  runApp(const TodoApp());
}