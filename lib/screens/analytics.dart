import 'package:flutter/material.dart';

class AnalyticsScreen extends StatelessWidget {
  const AnalyticsScreen({super.key});

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
          child: Text('Analytics Screen'),
        ),
      ),
    );
  }
}
