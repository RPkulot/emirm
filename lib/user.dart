import 'package:eirmuplb/main.dart';
import 'package:flutter/material.dart';

class UserRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationMenuDrawer(),
      appBar: AppBar(
        backgroundColor: Color(0xFF27ae60),
        title: const Text('Juan Pedro'),
      ),
      body: Image.asset(
          'assets/images/onionnobg.png')
    );
  }
}
