import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:torque_hours_x/firebase_options.dart';
import 'package:torque_hours_x/screens/analytics.dart';
import 'package:torque_hours_x/screens/attendance.dart';
import 'package:torque_hours_x/screens/home.dart';
import 'package:torque_hours_x/screens/leaderboard.dart';
import 'package:torque_hours_x/screens/settings.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int navigationIndex = 2;

  Widget getCurrentScreen() {
    return screens[navigationIndex];
  }

  List<Widget> screens = const [
    LeaderboardScreen(),
    AttendanceScreen(),
    HomeScreen(),
    AnalyticsScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const MaterialApp();
        }

        if (snapshot.connectionState == ConnectionState.done) {
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
              body: Center(
                child: getCurrentScreen(),
              ),
              bottomNavigationBar: Visibility(
                visible: true,
                child: Container(
                  decoration: const BoxDecoration(
                    border: Border(top: BorderSide(color: Colors.grey)),
                    borderRadius: BorderRadius.all(Radius.circular(15))
                  ),
                  child: BottomNavigationBar(
                    showUnselectedLabels: false,
                    backgroundColor: Colors.black,
                    selectedItemColor: Colors.blue,
                    unselectedItemColor: Colors.grey,

                    currentIndex: navigationIndex,

                    onTap: (index) {
                      setState(() {
                        navigationIndex = index;
                        }
                      );
                    },
                    
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
            ),
          );
        }

        return const MaterialApp();
      },
    );
  }
}
