import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hybrd_app/pages/home.dart';
import 'package:hybrd_app/pages/schedules.dart';

class BottomNavigation extends StatefulWidget {
  final UserCredential? credential;

  const BottomNavigation({Key? key, required this.credential}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int currentIndex = 0;

  final pages = [
    const HomePage(),
    const SchedulePage()
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) => setState(() {
            currentIndex = index;
          }),
          iconSize: 30.0,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home",
                backgroundColor: Colors.orange
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.calendar_today),
                label: "My Schedules",
                backgroundColor: Colors.orange
            )
          ]
      ),
    );
  }
}
