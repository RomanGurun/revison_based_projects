// ============================================================================
// FILE 10: lib/main.dart
// Copy this file into: lib/main.dart
// ============================================================================

import 'package:flutter/material.dart';
import 'views/language_selection_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ShopEase',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFFAFAFA),
      ),
      home: const LanguageSelectionScreen(),
    );
  }
}