import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sun_save/models/object_type.dart';
import 'package:sun_save/screens/about_screen.dart';
import 'package:sun_save/screens/home_screen.dart';
import 'package:sun_save/screens/stats_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ObjectType(),
      child: MaterialApp(
        // theme: ThemeData.dark(),
        home: MainScreen(),
      ),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var _currentIndex = 0;

  var pages = [
    HomeScreen(),
    StatsScreen(),
    AboutScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: <Widget>[
          SafeArea(child: pages[_currentIndex]),
          Align(
            alignment: Alignment.bottomCenter,
            child: Theme(
              data: Theme.of(context).copyWith(canvasColor: Colors.black),
              child: BottomNavigationBar(
                elevation: 0,
                currentIndex: _currentIndex,
                unselectedItemColor: Colors.white54,
                onTap: (newIndex) {
                  setState(() {
                    _currentIndex = newIndex;
                  });
                },
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home_outlined), label: 'Ana Ekran'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.bar_chart_rounded),
                      label: 'İstatistikler'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.info_outline_rounded), label: 'Hakkında')
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
