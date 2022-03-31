import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../models/models.dart';

class OnboardingScreen extends StatefulWidget {
  // Showing the OnBoardingScreen using static method MaterialPage Helper
  // Here, you define a static method to create a MaterialPage that sets
  // the appropriate unique identifier and creates onboardingScreen
  static MaterialPage page() {
    return MaterialPage(
      name: FooderlichPages.onboardingPath,
      key: ValueKey(FooderlichPages.loginPath),
      child: const OnboardingScreen(),
    );
  }

  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final controller = PageController();
  final Color rwColor = const Color.fromRGBO(64, 143, 77, 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: const Text('Getting Started'),
        leading: GestureDetector(
          child: const Icon(
            Icons.chevron_left,
            size: 35,
          ),
          onTap: () {
            Navigator.pop(context, true);
          },
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: buildPages()),
            buildIndicator(),
            buildActionButtons(),
          ],
        ),
      ),
    );
  }

  Widget buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        MaterialButton(
          child: const Text('Skip'),
          onPressed: () {
            // Onboarding -> Navigate to home
            // Here, tapping Skip triggers completeOnboarding() , which updates
            // the state and indicates that the user completed onboarding and is
            // redirected to the usual home screen.
            Provider.of<AppStateManager>(context, listen: false)
                .completeOnboarding();
          },
        ),
      ],
    );
  }

  Widget buildPages() {
    return PageView(
      controller: controller,
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      children: [
        onboardPageView(
          const AssetImage('assets/fooderlich_assets/recommend.png'),
          '''Check out weekly recommended recipes and what your friends are cooking!''',
        ),
        onboardPageView(
          const AssetImage('assets/fooderlich_assets/sheet.png'),
          'Cook with step by step instructions!',
        ),
        onboardPageView(
          const AssetImage('assets/fooderlich_assets/list.png'),
          'Keep track of what you need to buy',
        ),
      ],
    );
  }

  Widget onboardPageView(ImageProvider imageProvider, String text) {
    return Padding(
      padding: const EdgeInsets.all(40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Image(
              fit: BoxFit.fitWidth,
              image: imageProvider,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            text,
            style: const TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget buildIndicator() {
    return SmoothPageIndicator(
      controller: controller,
      count: 3,
      effect: WormEffect(
        activeDotColor: rwColor,
      ),
    );
  }
}
