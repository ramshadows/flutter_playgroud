/*
Defines your app state, how it can change and which components it
notifies when a change occurs.
AppStateManager manages the app’s navigation state.
*/

import 'dart:async';

import 'package:flutter/cupertino.dart';

class FooderlichTab {
  static const int explore = 0;
  static const int recipes = 1;
  static const int toBuy = 2;
}

class AppStateManager extends ChangeNotifier {
  // _initialized checks if the app is initialized.
  bool _initialized = false;
  // _loggedIn lets you check if the user has logged in.
  bool _loggedIn = false;
  // _onboardingComplete checks if the user completed the onboarding flow.
  bool _onboardingComplete = false;
  // _selectedTab keeps track of which tab the user is on.
  int _selectedTab = FooderlichTab.explore;

  bool get isInitialized => _initialized;
  bool get isLoggedIn => _loggedIn;
  bool get isOnboardingComplete => _onboardingComplete;
  int get selectedTab => _selectedTab;

  // Initializes App page
  void initializeApp() {
    Timer(const Duration(milliseconds: 2000), () {
      _initialized = true;

      notifyListeners();
    });
  }

  // Add login
  void login(String username, String password) {
    _loggedIn = true;

    notifyListeners();
  }

  // Add onboardingComplete
  void completeOnboarding() {
    _onboardingComplete = true;

    notifyListeners();
  }

  // Add goToTab
  void goToTab(index) {
    _selectedTab = index;

    notifyListeners();
  }

  // Add goToRecipes
  void goToRecipes() {
    _selectedTab = FooderlichTab.recipes;

    notifyListeners();
  }

  // Add logout
  void logout() {
    // Resets all app state properties.
    _initialized = false;
    _loggedIn = false;
    _onboardingComplete = false;
    _selectedTab = 0;

    // Reinitializes the app.
    initializeApp();

    // Notifies all listeners of state change.
    notifyListeners();
  }
}
