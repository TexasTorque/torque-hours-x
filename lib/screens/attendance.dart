import 'package:flutter/material.dart';

class AttendanceScreen extends StatelessWidget {
  const AttendanceScreen({super.key});

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
        body: Center(
          child: Text('Attendance Screen'),
        ),
      ),
    );
  }
}
