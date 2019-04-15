import 'package:flutter/material.dart';
import 'package:cma_flutter/screens/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CMA Flutter',
      theme: ThemeData(
        primarySwatch: Colors.green
      ),
      home: HomeScreen()
    );
  }
}




