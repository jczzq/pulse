import 'package:flutter/material.dart';
import './pages/index.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: MaterialApp(
      title: 'Welcome to Flutter',
      theme: new ThemeData(
        primaryColor: Colors.cyan,
      ),
      home: IndexPage(),
    ));
  }
}
