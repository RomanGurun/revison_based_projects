import 'package:flutter/material.dart';
import 'package:totto/widgets/common_app_bar.dart'; // import the CommonAppBar

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Here is where you use CommonAppBar
      appBar: CommonAppBar(
        title: const Text(
          "Profile",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context), // Back button
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Do something when settings clicked
            },
          ),
        ],
      ),
      body: const Center(
        child: Text("Profile Screen Content"),
      ),
    );
  }
}
