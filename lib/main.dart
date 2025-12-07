// ============================================================================
// FILE 9: lib/main.dart
// Copy this entire file into: lib/main.dart
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'views/pages/task_home_page.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Manager',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.blue, useMaterial3: true),
      home: const TaskHomePage(),
    );
  }
}