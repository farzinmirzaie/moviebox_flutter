import 'package:flutter/material.dart';
import 'package:moviebox/pages/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'MovieBox', home: HomePage());
  }
}
