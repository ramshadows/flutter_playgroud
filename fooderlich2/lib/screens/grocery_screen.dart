import 'package:flutter/material.dart';
import 'package:fooderlich2/models/models.dart';
import 'package:fooderlich2/screens/empty_grocery_screen.dart';
import 'package:fooderlich2/screens/grocery_item_screen.dart';
import 'package:fooderlich2/screens/grocery_list_screen.dart';
import 'package:provider/provider.dart';

class GroceryScreen extends StatelessWidget {
  const GroceryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // The main layout structure for GroceryScreen is a scaffold
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            // Presents GroceryItemScreen

            // Returns the GroceryManager available in the tree
            final manager = Provider.of<GroceryManager>(context, listen: false);

            // Navigator.push() adds a new route to the stack of routes.
            Navigator.push(
              context,
              /* 
              MaterialPageRoute replaces the entire screen with a 
              platform-specific transition. In Android, for example, it slides 
              upwards and fades in. In iOS, it slides in from the right.
              */
              MaterialPageRoute(
                // Creates a new GroceryItemScreen within the route’s builder
                // callback.
                builder: (context) => GroceryItemScreen(
                  // onCreate defines what to do with the created item.
                  onCreate: (item) {
                    // addItem() adds this new item to the list of items.
                    manager.addItem(item);

                    // Once the item is added to the list, pop removes the
                    //top navigation route item, GroceryItemScreen , to show
                    //the list of grocery items.
                    Navigator.pop(context);
                  },

                  // onUpdate will never get called since you are creating a new item.
                  onUpdate: (item) {},
                ),
              ),
            );
          }),
      body: buildGroceryScreen(),
    );
  }

  // buildGroceryScreen() is a helper function that decides which widget tree
  // to construct
  Widget buildGroceryScreen() {
    // You wrap your widgets inside a Consumer , which listens for
    // GroceryManager state changes.
    return Consumer<GroceryManager>(
      // Consumer rebuilds the widgets below itself when the grocery manager
      // items changes
      builder: (context, groceryManager, child) {
        // Adds GroceryListScreen
        // The grocery list will display if the user has items in the list
        if (groceryManager.groceryItems.isNotEmpty) {
          return GroceryListScreen(manager: groceryManager);
        } else {
          return const EmptyGroceryScreen();
        }
      },
    );
  }
}
