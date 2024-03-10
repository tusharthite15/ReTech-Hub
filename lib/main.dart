import 'package:flutter/material.dart';
import 'package:oa_drawer/ui/login_screen.dart'; // Import your login screen here

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Re-tech Hub',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
    );
  }
}
