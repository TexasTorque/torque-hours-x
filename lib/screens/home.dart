import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:torque_hours_x/auth/login_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TORQUE HOURS',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black, 
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.white)
        )
      ),
      home: Scaffold(
        body: FirebaseAuth.instance.currentUser == null ? getLoginWidget() : const Center(
          child: Text("Home Screen"),
        ),
      ),
    );
  }
}
