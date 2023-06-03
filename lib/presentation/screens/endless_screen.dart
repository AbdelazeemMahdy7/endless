
import 'package:endless/presentation/screens/favorite_screen.dart';
import 'package:endless/presentation/screens/home_screen.dart';
import 'package:endless/presentation/screens/profile_screen.dart';
import 'package:endless/presentation/screens/settings_screen.dart';
import 'package:flutter/material.dart';

class EndlessScreen extends StatefulWidget {
  EndlessScreen({Key? key}) : super(key: key);

  @override
  State<EndlessScreen> createState() => _EndlessScreenState();
}

class _EndlessScreenState extends State<EndlessScreen> {
  int currentIndex = 1;

  List<Widget> screens = [
    ProfileScreen(),
    HomeScreen(),
    FavoriteScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          currentIndex =value;
          setState((){});
        },
        currentIndex: currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: "Favorite",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
      ),
    );
  }
}
