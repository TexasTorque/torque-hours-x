import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

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
        appBar: AppBar(
          toolbarHeight: 100,
          backgroundColor: Colors.black,
          title: Container(
            margin: const EdgeInsets.only(left: 80, right: 80),
            padding: const EdgeInsets.only(top: 5, bottom: 5),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 5)
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(image: AssetImage('assets/imgs/torque_logo.png'), width: 50),
                Text('TORQUE HOURS', style: TextStyle(fontFamily: 'Market Deco', color: Colors.white)),
              ],
            ),
          ),
        ),
        body: const Row(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('test'),
            ),
            Text('testing again'),
            Text('testing again'),
            Text('testing again'),
            Icon(Icons.backpack)
          ],
        ),
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            border: Border(top: BorderSide(color: Colors.grey)),
            borderRadius: BorderRadius.all(Radius.circular(15))
          ),
          child: BottomNavigationBar(
            backgroundColor: Colors.black,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.leaderboard),
                label: 'Leaderboard',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.co_present),
                label: 'Attendance',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.analytics),
                label: 'Analytics',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Settings',
              ),
            ],
            type: BottomNavigationBarType.fixed,
          ),
        ),
      ),
    );
  }
}
