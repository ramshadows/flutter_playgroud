import 'package:flutter/material.dart';
import 'package:fooderlich3/models/app_state_manager.dart';
import 'package:fooderlich3/models/fooderlich_pages.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  // Showing the SplashScreen using static method MaterialPage Helper
  // Here, you define a static method to create a MaterialPage that sets
  // the appropriate unique identifier and creates SplashScreen
  static MaterialPage page() {
    return MaterialPage(
      name: FooderlichPages.splashPath,
      key: ValueKey(FooderlichPages.splashPath),
      child: const SplashScreen(),
    );
  }

  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Initializes App
    // Here, you use the current context to retrieve the AppStateManager to 
    // initialize the app.
    Provider.of<AppStateManager>(context, listen: false).initializeApp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Image(
              height: 200,
              image: AssetImage('assets/fooderlich_assets/rw_logo.png'),
            ),
            Text('Initializing...'),
          ],
        ),
      ),
    );
  }
}
