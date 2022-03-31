//A simple tile that displays the picture, the name and the duration of a recipe

import 'package:flutter/material.dart';
import 'package:fooderlich2/models/models.dart';

class RecipeThumbnail extends StatelessWidget {
  final SimpleRecipe recipe;

  const RecipeThumbnail({
    Key? key,
    required this.recipe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // 8-point padding all around
      padding: const EdgeInsets.all(8.0),
      // Column to apply a vertical layout
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Using Expanded Widget to make the image to fill the remaining space
          Expanded(
            // ClipRRect clips the image to make the borders rounded
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.asset(
                recipe.dishImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Add some room between the image and the other widgets
          const SizedBox(height: 10),
          // display the recipe’s title
          Text(
            recipe.title,
            maxLines: 1,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          // display the recipe’s duration
          Text(
            recipe.duration,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ],
      ),
    );
  }
}
