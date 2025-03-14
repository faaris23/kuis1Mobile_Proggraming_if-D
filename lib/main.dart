import 'package:flutter/material.dart';
import 'data_diri_screen.dart';
import 'hari_screen.dart';
import 'kubus_screen.dart';
import 'home_screen.dart';
import 'trapesium_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Flutter',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
      routes: {
        '/trapesium': (context) => TrapesiumScreen(),
        '/kubus': (context) => KubusScreen(),
        '/hari': (context) => HariScreen(),
        '/dataDiri': (context) => DataDiriScreen(),
      },
    );
  }
}
