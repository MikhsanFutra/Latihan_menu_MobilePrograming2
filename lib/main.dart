import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter_Menu',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Menu'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  Color _backgroundColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Container(
        color: _backgroundColor,
        child: Center(
          child: _currentIndex == 0
              ? Text(
                  'Dashboard',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                )
              : Container(),
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        items: [
          BottomNavyBarItem(
            icon: Icon(Icons.apps),
            title: Text('Home'),
            activeColor: Colors.red,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.people),
            title: Text('Users'),
            activeColor: Colors.purpleAccent,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.message),
            title: Text('Messages'),
            activeColor: Colors.pink,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.settings),
            title: Text('Settings'),
            activeColor: Colors.blue,
          ),
        ],
        onItemSelected: (int value) {
          setState(() {
            _currentIndex = value;

            if (value == 0) {
              _backgroundColor = Colors.white;
            } else if (value == 1) {
              _backgroundColor = Colors.purple;
            } else if (value == 2) {
              _backgroundColor = Colors.red;
            } else if (value == 3) {
              _backgroundColor = Colors.blue;
            }
          });
        },
      ),
    );
  }
}
