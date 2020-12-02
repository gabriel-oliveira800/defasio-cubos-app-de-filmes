import 'package:flutter/material.dart';

import 'components/header_app.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 48,
            horizontal: 20,
          ),
          child: Column(
            children: [
              HeaderApp(onChanged: (v) => print(v)),
            ],
          ),
        ),
      ),
    );
  }
}
