import 'package:flutter/material.dart';
import 'package:fooderlich2/api/mock_fooderlich_service.dart';
import 'package:fooderlich2/components/components.dart';
import 'package:fooderlich2/models/models.dart';

class RecipesScreen extends StatelessWidget {
  // Create a mock service
  final exploreService = MockFooderlichService();

  RecipesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Use getRecipes() to return the list of recipes to display.
      //This function returns a future list of SimpleRecipe s
      future: exploreService.getRecipes(),
      builder: (context, AsyncSnapshot<List<SimpleRecipe>> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return RecipesGridView(
            recipes: snapshot.data ?? [],
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
