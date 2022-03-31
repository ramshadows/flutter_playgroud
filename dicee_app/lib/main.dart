import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int diceNum;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Dicee App",
      home: Scaffold(
        backgroundColor: Colors.blueAccent.shade200,
        appBar: AppBar(
          title: Text("Dicee App"),
        ),
        body: Center(
          child: Row(
            children: <Widget>[
              Expanded(
                child: FlatButton(
                  onPressed: () {
                    setState(() {
                      diceNum = Random().nextInt(6) + 1;
                    });
                  },
                  child: Image.asset("images/$diceNum.png"),
                ),
              ),
              Expanded(
                child: FlatButton(
                  onPressed: () {setState(() {
                    diceNum = Random().nextInt(6) + 1;
                  });},
                  child: Image.asset("images/dice1.png"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
