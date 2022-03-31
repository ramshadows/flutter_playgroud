import 'package:flutter/material.dart';
import 'package:fooderlich2/components/grocery_tile.dart';
import 'package:fooderlich2/models/models.dart';
import 'package:fooderlich2/screens/grocery_item_screen.dart';

class GroceryListScreen extends StatelessWidget {
  final GroceryManager manager;
  const GroceryListScreen({
    Key? key,
    required this.manager,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get the list of grocery items from the manager.
    final groceryItems = manager.groceryItems;
    // Adds a ListView
    return Padding(
      // Apply padding of 16 pixels all around this screen.
      padding: const EdgeInsets.all(16.0),

      // Add ListView .
      child: ListView.separated(
        // Set the number of items in the list equal to grocery items number
        itemCount: groceryItems.length,
        itemBuilder: (context, index) {
          // For each item in the list, get the current item and construct a
          // GroceryTile .
          final item = groceryItems[index];
          // Wrapped InkWell inside a Dismissible Widget
          return Dismissible(
            // The dismissible widget includes a Key . Flutter needs this to
            // find and remove the right element in the tree.
            key: Key(item.id),
            // Sets the direction the user can swipe to dismiss.
            direction: DismissDirection.endToStart,
            /* Selects the background widget to display behind the widget you’re
               swiping. In this case, the background widget is grey with a white
               trash can Icon aligned in the center and to the right of the 
               Container
            */
            background: Container(
                color: Colors.grey.shade600,
                alignment: Alignment.centerRight,
                child: const Icon(Icons.delete_forever,
                    color: Colors.white, size: 50.0)),
            // onDismissed lets you know when the user swiped away a GroceryTile
            onDismissed: (direction) {
              // Lets the grocery manager handle deleting the item, given an
              // index.
              manager.deleteItem(index);
              // Shows a snack bar widget to let the user know which item they
              // deleted.
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('${item.name} dismissed')));
            },
            // You wrap GroceryTile inside an InkWell .
            // When the gesture recognizes a tap, it presents GroceryItemScreen ,
            // letting the user edit the current item.
            child: InkWell(
              child: GroceryTile(
                key: Key(item.id),
                item: item,
                // Return onComplete when the user taps the checkbox.
                onComplete: (change) {
                  // Check if there is a change and update the item’s isComplete
                  // status.
                  if (change != null) {
                    manager.completeItem(index, change);
                  }
                },
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    // GroceryItemScreen calls onUpdate when the user updates an
                    // item.
                    builder: (context) => GroceryItemScreen(
                      originalItem: item,
                      onUpdate: (item) {
                        // GroceryManager updates the item at the particular index.
                        manager.updateItem(item, index);
                        // Dismisses GroceryItemScreen .
                        Navigator.pop(context);
                      },
                      // onCreate will not be called since you are updating an
                      // existing item.
                      onCreate: (item) {},
                    ),
                  ),
                );
              },
            ),
          );
        },
        // Space each grocery item 16 pixels apart.
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 16.0,
          );
        },
      ),
    );
  }
}
