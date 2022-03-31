import 'package:flutter/material.dart';
import 'package:fooderlich/card1.dart';
import 'package:fooderlich/card2.dart';
import 'package:fooderlich/card3.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //_selectedIndex keeps track of which tab is currently selected
  int _selectedIndex = 0;

  static List<Widget> pages = [
    const Card1(),
    const Card2(),
    const Card3(),
  ];

  void _onBottomNaviBarTap(int index) {
    setState(() {
      //_selected index is the state being tracked by _HomeState .
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Fooderlich',
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        //currentIndex will tell the bottom navigation bar which
        //tab bar item to highlight.
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).textSelectionTheme.selectionColor,
        //When the user taps on a tab bar item, it calls the
        //_onBottomNaviBarTap handler, which updates the state with
        //the correct index . In this case, it changes the color.
        onTap: _onBottomNaviBarTap,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.card_giftcard,
            ),
            label: 'Card1',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.card_giftcard,
            ),
            label: 'Card2',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.card_giftcard,
            ),
            label: 'Card3',
          ),
        ],
      ),
    );
  }
}
