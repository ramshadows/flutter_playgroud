import 'package:flutter/material.dart';
import 'package:fooderlich2/home.dart';
import 'package:fooderlich2/models/models.dart';
import 'package:provider/provider.dart';

import 'fooderlich_theme.dart';

void main() {
  runApp(const Fooderlich());
}

class Fooderlich extends StatelessWidget {
  const Fooderlich({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = FooderlichTheme.light();
    return MaterialApp(
      theme: theme,
      title: 'Fooderlich',

      // Provide the TabManager change notifier at the root level of Fooderlich
      // This allows descendant widgets to access the tab manager.
      // You assign MultiProvider as a property of Home . This accepts a list
      // of providers for Home ’s descendant widgets to access.
      home: MultiProvider(
        providers: [
          // ChangeNotifierProvider creates an instance of TabManager ,
          //which listens to tab index changes and notifies its listeners.
          ChangeNotifierProvider(
            create: (context) => TabManager(),
          ),

          // Add GroceryManager Provider
          ChangeNotifierProvider(
            create: (context) => GroceryManager(),
          ),
        ],
        child: const Home(),
      ),
    );
  }
}
