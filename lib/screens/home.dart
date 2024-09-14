import 'package:flutter/material.dart';

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
      home: const Scaffold(
        body: Text('Home Screen'),
      ),
    );
  }
}
