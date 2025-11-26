import 'package:flutter/material.dart';
import 'package:totto/screens/profile_screen.dart';
import 'package:totto/widgets/common_app_bar.dart';

import '../widgets/common_app_bar.dart';


class HomeScreen extends StatelessWidget{
  const HomeScreen({super.key});


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
  return Scaffold( appBar:
    CommonAppBar(
      title: Text("Home"),
    ),

  body: Column(
    children:[ const Center(
      child: Text("Welcome to Home Screen"),





    ),

      ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ProfileScreen()),
          );
        },
        child: const Text("Go to Profile"),
      )








    ],


  ),


  );

  }
}