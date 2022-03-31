import 'package:flutter/material.dart';
import 'package:fooderlich2/components/components.dart';
import 'package:fooderlich2/models/models.dart';

// RecipesGridView requires a list of recipes to display in a grid
class RecipesGridView extends StatelessWidget {
  final List<SimpleRecipe> recipes;
  const RecipesGridView({
    Key? key,
    required this.recipes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      // Apply a 16 point padding on the left, right, and top.
      padding: const EdgeInsets.only(
        left: 16.0,
        right: 16.0,
        top: 16.0,
      ),
      // GridView.builder , which displays only the items visible onscreen
      child: GridView.builder(
        itemCount: recipes.length,
        // Tell the grid view how many items will be in the grid
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          // maxCrossAxisExtent sets the maximum extent of tiles in the
          //cross axis. So making maxCrossAxisExtent greater than the device’s
          //width would allow for only one column!
          maxCrossAxisExtent: 500.0,
        ),
        // For every index, fetch the recipe and create a corresponding
        // RecipeThumbnail
        itemBuilder: (context, index) {
          final simpleRecipe = recipes[index];
          return RecipeThumbnail(recipe: simpleRecipe);
        },
      ),
    );
  }
}
