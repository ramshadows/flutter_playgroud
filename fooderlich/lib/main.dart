import 'package:flutter/material.dart';
import 'package:fooderlich/fooderlich_theme.dart';
import 'package:fooderlich/home.dart';

void main() {
  runApp(const Fooderlich());
}

class Fooderlich extends StatelessWidget {
  const Fooderlich({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final myTheme = FooderlichTheme.light();

    return MaterialApp(
      theme: myTheme,
      title: 'Fooderlich',
      home: const Home(),
    );
  }
}
