/*
Router configures the list of pages the Navigator displays. It listens to state
managers and, based on the state changes, configures the list of page routes.
*/

import 'package:flutter/cupertino.dart';
import 'package:fooderlich3/models/models.dart';
import 'package:fooderlich3/screens/screens.dart';

// AppRouter class creates the router widget
// extends RouterDelegate . The system will tell the router to build and
// configure a navigator widget.
class AppRouter extends RouterDelegate
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  @override
  // Declares GlobalKey , a unique key across the entire app.
  final GlobalKey<NavigatorState> navigatorKey;

  // Declares AppStateManager . The router will listen to app state changes
  // to configure the navigator’s list of pages.
  final AppStateManager appStateManager;

  // Declares GroceryManager to listen to the user’s state when you create or
  // edit an item
  final GroceryManager groceryManager;

  // Declares ProfileManager to listen to the user profile state.
  final ProfileManager profileManager;

  AppRouter({
    required this.appStateManager,
    required this.groceryManager,
    required this.profileManager,
  }) : navigatorKey = GlobalKey<NavigatorState>() {
    // Adds Listeners
    // The listeners connect the state managers. When the state changes, the
    // router will reconfigure the navigator with a new set of pages.
    /*
    appStateManager: Determines the state of the app. It manages whether the app
                     initialized login and if the user completed the onboarding.

    groceryManager: Manages the list of grocery items and the item selection state.
    profileManager: Manages the user’s profile and settings. 

    NB: When you dispose the router, you must remove all listeners. Forgetting 
    to do this will throw an exception.
    */
    appStateManager.addListener(notifyListeners);
    groceryManager.addListener(notifyListeners);
    profileManager.addListener(notifyListeners);
  }

  // Adds Dispose listerner
  @override
  void dispose() {
    appStateManager.removeListener(notifyListeners);
    groceryManager.removeListener(notifyListeners);
    profileManager.removeListener(notifyListeners);

    super.dispose();
  }

  // RouterDelegate requires you to add a build() . This configures your
  // navigator and pages.
  @override
  Widget build(BuildContext context) {
    // Configures a Navigator .
    return Navigator(
      // Uses the navigatorKey , which is required to retrieve the current
      // navigator.
      key: navigatorKey,
      // Declares pages , the stack of pages that describes your navigation
      // stack.

      // This way, it’s called every time a page pops from the stack.
      onPopPage: _handlePopPage,
      pages: [
        // Adds SplashScreen
        // Here, you check if the app is initialized. If it’s not, you show
        // the Splash screen.
        if (!appStateManager.isInitialized) SplashScreen.page(),
        // Adds LoginScreen
        // if the app initialized and the user hasn’t logged in, it should show
        // the login page.
        if (appStateManager.isInitialized && !appStateManager.isLoggedIn)
          LoginScreen.page(),
        // Adds OnboardingScreen
        // Here, you’re showing the Onboarding screen if the user is logged
        // in but hasn’t completed the Onboarding Guide yet.
        if (appStateManager.isLoggedIn && !appStateManager.isOnboardingComplete)
          OnboardingScreen.page(),
        // Add Home
        // This tells your app to show the home page only when the user
        // completes onboarding.
        if (appStateManager.isOnboardingComplete)
          Home.page(appStateManager.selectedTab),
        // Create new item
        // Checks if the user is creating a new grocery item.
        // If so, shows the Grocery Item screen.
        // Once the user saves the item, updates the grocery list.
        // onUpdate only gets called when the user updates an existing item.
        if (groceryManager.isCreatingNewItem)
          GroceryItemScreen.page(
            onCreate: (item) {
              groceryManager.addItem(item);
            },
            onUpdate: (item, index) {
              // No Update
            },
          ),
        // Select GroceryItemScreen
        // Checks to see if a grocery item is selected.
        // If so, creates the Grocery Item screen page.
        // When the user changes and saves an item, it updates the item at
        // the current index
        if (groceryManager.selectedIndex != -1)
          GroceryItemScreen.page(
            item: groceryManager.selectedGroceryItem,
            index: groceryManager.selectedIndex,
            onUpdate: (item, index) {
              groceryManager.updateItem(item, index);
            },
            onCreate: (_) {
              // No create
            },
          ),

        // Adds Profile Screen
        // This checks the profile manager to see if the user selected
        // their profile. If so, it shows the Profile screen.
        if (profileManager.didSelectUser)
          ProfileScreen.page(profileManager.getUser),
        // Add WebView Screen
        // This checks if the user tapped the option to go to the 
        // raywenderlich.com website. If so, it presents the WebView screen.
        if(profileManager.didTapOnRaywenderlich) WebViewScreen.page(),
      ],
    );
  }

  /*
  When the user taps the Back button or triggers a system back button event, 
  it fires a helper method, onPopPage .

  Here’s how it works:
    1. This is the current Route , which contains information like RouteSettings
       to retrieve the route’s name and arguments.
    2. result is the value that returns when the route completes — a value that 
       a dialog returns, for example.
    3. Checks if the current route’s pop succeeded.
    4. If it failed, return false .
    5. If the route pop succeeds, this checks the different routes and triggers 
       the appropriate state changes.

  */
  // Adds _handlePopPage
  bool _handlePopPage(Route<dynamic> route, result) {
    if (!route.didPop(result)) {
      return false;
    }
    // Handle onBoarding and Splash
    // If the user taps the Back button from the Onboarding screen, it calls
    // logout() . This resets the entire app state and the user has to log in
    // again.
    if (route.settings.name == FooderlichPages.onboardingPath) {
      appStateManager.logout();
    }
    // Handle state when user closes grocery item screen
    // This ensures that the appropriate state is reset when the user taps
    // the back button from the Grocery Item screen.
    if (route.settings.name == FooderlichPages.groceryItemDetails) {
      groceryManager.groceryItemTapped(-1);
    }
    // Handle state when user closes profile screen
    // This checks to see if the route you are popping is indeed the profilePath
    // , then tells the profileManager that the Profile screen is not visible 
    // anymore.
    if (route.settings.name == FooderlichPages.profilePath) {
      profileManager.tapOnProfile(false);
    }
    // Handle state when user closes WebView screen
    // Here, you check if the name of the route setting is raywenderlich, 
    // then call the appropriate method on profileManager .
    if (profileManager.didTapOnRaywenderlich) {
      WebViewScreen.page();
    }

    return true;
  }

  // Sets setNewRoutePath to null since you aren’t supporting Flutter web apps
  @override
  // ignore: avoid_returning_null_for_void
  Future<void> setNewRoutePath(configuration) async => null;
}
