import 'package:flutter/material.dart';
import 'package:oa_drawer/pages/Authentication/login_page.dart';

void main() {
  runApp(const oa_drawer());
}
class oa_drawer extends StatefulWidget {
  const oa_drawer({Key? key}) : super(key: key);

  @override
  State<oa_drawer> createState() => _oa_drawerState();
}

class _oa_drawerState extends State<oa_drawer> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoginPage(), // Call your LoginPage here

    );
  }
}
