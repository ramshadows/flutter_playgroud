import 'package:flutter/material.dart';
import 'package:fooderlich2/models/models.dart';
import 'package:fooderlich2/screens/explore_screen.dart';
import 'package:fooderlich2/screens/grocery_screen.dart';
import 'package:fooderlich2/screens/recipes_screen.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static List<Widget> pages = <Widget>[
    ExploreScreen(),
    RecipesScreen(),
    const GroceryScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    // Wraps all the widgets inside Consumer . When TabManager changes,
    // the widgets below it will rebuild.
    return Consumer<TabManager>(builder: (context, tabManager, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            'Fooderlich',
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        /* IndexedStack allows you to easily switch widgets in your app. 
           It only shows one child widget at a time, but it preserves the 
           state of all the children.
        */
        body: IndexedStack(
          index: tabManager.selectedTabIndex,
          children: pages,
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor:
              Theme.of(context).textSelectionTheme.selectionColor,
          // Sets the current index of BottomNavigationBar
          currentIndex: tabManager.selectedTabIndex,
          onTap: (index) {
            // Calls manager.goToTab() when the user taps a different tab,
            // to notify other widgets that the index changed.
            tabManager.goToTab(index);
          },
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.explore),
              label: 'Explore',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book),
              label: 'Recipes',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'To Buy',
            ),
          ],
        ),
      );
    });
  }
}
