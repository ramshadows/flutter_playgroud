import 'package:flutter/material.dart';
import 'package:slivers_in_flutter/shared_widgets/app_bar_widget.dart';

import '../../constants/colors.dart';
import '../../models/recipe_model.dart';
import 'widgets/pill_widget.dart';
import 'widgets/sliver_sub_header.dart';

class RecipePage extends StatelessWidget {
  final RecipeModel recipe;

  const RecipePage(this.recipe, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          AppBarWidget(
            text: recipe.title,
            imagePath: recipe.mainImagePath,
          ),
          SliverSubHeader(
            text: 'Instructions',
            backgroundColor: recipe.itemColor,
          ),

          // SliverToBoxAdapter to converts widget that produces a RenderBox,
          //like a SizedBox or a Container to slivers to add it to
          //CustomScrollView and scroll it with the other slivers even though
          //it’s not a sliver?
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Text(
                recipe.instructions,
                style: const TextStyle(
                  color: AppColors.navy,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          SliverSubHeader(
            text: 'Ingredients',
            backgroundColor: recipe.itemColor,
          ),
          SliverPadding(
            padding: const EdgeInsets.all(15),
            sliver: SliverGrid.count(
              // Define the main and cross spacing between the box children
              mainAxisSpacing: 15,
              crossAxisSpacing: 10,
              // Give the crossAxisCount a number that constrains the count of
              //horizontal elements.
              crossAxisCount: 3,
              // By defining the ratio of the length to the width of the
              //PillWidget, you constraint the height of each rendered element
              //in the grid.
              childAspectRatio: 3,
              // Transform the list of ingredients to a list of PillWidgets.
              children: recipe.ingredients.map((e) => PillWidget(e)).toList(),
            ),
          ),

          // Finally, for it to work as expected, you need to provide a
          //SliverFillRemaining at the end of CustomScrollView below
          SliverSubHeader(
            text: 'Numbers',
            backgroundColor: recipe.itemColor,
          ),

          // Similar implementation as above but now using SliverGrid constructor
          // as opposed to SliverGrid.count has it is considered more efficient.
          SliverPadding(
            padding: const EdgeInsets.all(15),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200.0,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 4,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) => PillWidget(
                  recipe.details[index],
                ),
                childCount: recipe.details.length,
              ),
            ),
          ),
          SliverFillRemaining(
            child: Container(),
          ),
        ],
      ),
    );
  }
}
