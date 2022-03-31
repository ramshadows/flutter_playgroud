import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'StatefulWidget Demo',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: MaximumBid(),
    );
  }
}

class MaximumBid extends StatefulWidget {
  const MaximumBid({Key? key}) : super(key: key);

  @override
  _MaximumBidState createState() => _MaximumBidState();
}

class _MaximumBidState extends State<MaximumBid> {
  double _maxBid = 0.00;

  void _increaseMyMaxBid() {
    setState(() {
      _maxBid += 50.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Stateful Widget Demo'),
        leading: IconButton(
          onPressed: null,
          icon: Icon(Icons.menu),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: null,
            icon: Icon(Icons.search),
          ),
          IconButton(
            onPressed: null,
            icon: Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'My maximum bid: $_maxBid',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _increaseMyMaxBid,
        tooltip: 'Increment Bid',
        child: Icon(
          Icons.add,
        ),
        mini: false,
        highlightElevation: 20.0,
      ),
    );
  }
}
