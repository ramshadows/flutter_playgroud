import 'package:flutter/material.dart';
import 'package:slivers_in_flutter/constants/app_image_paths.dart';

import 'package:slivers_in_flutter/data/recipe_repository.dart';
import 'package:slivers_in_flutter/shared_widgets/app_bar_widget.dart';

import 'widgets/footer_widget.dart';
import 'widgets/recipe_item_widget.dart';

class RecipeListPage extends StatelessWidget {
  const RecipeListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Fetch the recipe list from the repository.
    final recipes = RecipeRepository.getRecipes();

    // Define the main widget where you’ll put all your slivers.
    return Scaffold(
      // Use a CustomScrollView that has a slivers argument, instead of the
      //commonly used children, to remind you that all its children must
      //produce RenderSliver
      body: CustomScrollView(
        slivers: <Widget>[
          /*
          Here’s what you just did:

             Instead of adding AppBarWidget to the appBar in Scaffold, 
             you inserted it directly as a child in CustomListView above the 
             recipe list, since it is a sliver. Then, you used AppImagePaths 
             to provide the AppBarWidget with the main image path.


          */
          const AppBarWidget(
            text: 'Reciperlich',
            imagePath: AppImagePaths.mainImage,
            centerTitle: true,
          ),
          // SliverFixedExtentList returns a sliver that displays a linear list
          //of children, all with the same extent, width or height, depending
          //on the main axis.
          SliverPadding(
            padding: const EdgeInsets.all(20.0),
            sliver: SliverFixedExtentList(
              // Determine the item extent of a single recipe item.
              //In this case, the extent is the height.
              itemExtent: 110,

              // Determine the delegate type as SliverChildBuilderDelegate and
              //give this delegate the childCount which is the recipes’ count.
              //The delegate returns an index value
              delegate: SliverChildBuilderDelegate(
                (context, index) => Padding(
                  padding: const EdgeInsets.only(
                    bottom: 20,
                  ),
                  // The child itself is a RecipeItem which receives a RecipeModel
                  // from the list of recipes.
                  child: RecipeItem(recipes[index]),
                ),
                childCount: recipes.length,
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: FooterWidget(),
          ),
        ],
      ),
    );
  }
}
