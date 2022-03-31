import 'package:flutter/material.dart';
import 'package:fooderlich2/models/models.dart';
import 'package:provider/provider.dart';

class EmptyGroceryScreen extends StatelessWidget {
  const EmptyGroceryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Adds an empty image
            // Flexible gives a child the ability to fill the available space
            // in the main axis
            Flexible(
              /* 
              AspectRatio sizes its child to the specified aspectRatio . 
              Although aspectRatio is a double, the Flutter documentation 
              recommends writing it as width / height instead of the calculated 
              result. In this case, you want a square aspect ratio of 1 / 1 
              and not 1.0 .

              Note: Dart does the calculation for you to provide the double. 
              What if you’d wanted a 16:9 ratio? You’d put 16 / 9 and not 1.5 .
              */
              child: AspectRatio(
                aspectRatio: 1 / 1,
                child: Image.asset('assets/fooderlich_assets/empty_list.png'),
              ),
            ),
            // Adds an  empty screen title
            Text(
              'No Groceries',
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(height: 16.0),
            // Adds an empty screen subtitle
            const Text(
              'Shopping for ingredients?\n'
              'Tap the + button to write them down!',
              textAlign: TextAlign.center,
            ),

            // Adds browse recipe button
            MaterialButton(
              textColor: Colors.white,
              child: const Text('Browse Recipes'),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              color: Colors.green,
              onPressed: () {
                // Go to recipe list
                // you use Provider.of() to access the model object, TabManager
                // goToRecipes() sets the index to the Recipes tab.
                //This notifies Consumer to rebuild Home with the right tab index.
                Provider.of<TabManager>(context, listen: false).goToRecipes();
              },
            )
          ],
        ),
      ),
    );
  }
}
