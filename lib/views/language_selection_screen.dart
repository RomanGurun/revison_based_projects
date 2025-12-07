// ============================================================================
// FILE 2: lib/views/language_selection_screen.dart
// Copy this file into: lib/views/language_selection_screen.dart
// ============================================================================

import 'package:flutter/material.dart';
import 'onboarding_screen.dart';

class LanguageSelectionScreen extends StatefulWidget {
  const LanguageSelectionScreen({super.key});

  @override
  State<LanguageSelectionScreen> createState() => _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState extends State<LanguageSelectionScreen> {
  String _selectedLanguageCode = 'en';

  final List<Map<String, dynamic>> languages = [
    {
      'code': 'en',
      'flagPath': 'assets/flags/us.png',
      'title': 'English',
      'subtitle': 'English',
      'isSelectable': true
    },
    {
      'code': 'ne',
      'flagPath': 'assets/flags/np.png',
      'title': 'नेपाली',
      'subtitle': 'Nepali',
      'isSelectable': true
    },
    {
      'code': 'en_NE',
      'flagPath': 'assets/flags/mixed.png',
      'title': 'English & नेपाली',
      'subtitle': 'Mixed',
      'isSelectable': false
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 40),
            const Text(
              'Language',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Choose your preferred language',
              style: TextStyle(color: Colors.grey, fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                itemCount: languages.length,
                itemBuilder: (context, index) {
                  final language = languages[index];
                  final bool isSelectable = language['isSelectable'];

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: GestureDetector(
                      onTap: isSelectable
                          ? () {
                        setState(() {
                          _selectedLanguageCode = language['code']!;
                        });
                      }
                          : null,
                      child: Opacity(
                        opacity: isSelectable ? 1.0 : 0.5,
                        child: LanguageOption(
                          flagPath: language['flagPath']!,
                          title: language['title']!,
                          subtitle: language['subtitle'],
                          selected: isSelectable && _selectedLanguageCode == language['code'],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFD80015),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const OnboardingScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    'Continue',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LanguageOption extends StatelessWidget {
  final String flagPath;
  final String title;
  final String? subtitle;
  final bool selected;

  const LanguageOption({
    super.key,
    required this.flagPath,
    required this.title,
    this.subtitle,
    this.selected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: selected ? Colors.red : Colors.grey.shade300,
          width: selected ? 2 : 1,
        ),
        borderRadius: BorderRadius.circular(12),
        color: selected ? Colors.red.withOpacity(0.05) : Colors.white,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.shade200,
                ),
                child: const Icon(Icons.language, color: Colors.grey),
              ),
              const SizedBox(width: 16),
              Text(
                title,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          if (selected)
            const Icon(Icons.check_circle, color: Colors.red, size: 24),
        ],
      ),
    );
  }
}