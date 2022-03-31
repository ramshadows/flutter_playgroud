import 'package:flutter/material.dart';
import 'package:recipes/recipe.dart';

class RecipeDetail extends StatefulWidget {
  final Recipe recipe;

  const RecipeDetail({Key? key, required this.recipe}) : super(key: key);

  @override
  _RecipeDetailState createState() => _RecipeDetailState();
}

class _RecipeDetailState extends State<RecipeDetail> {
  int _sliderVal = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.recipe.label),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            //SizedBox around the Image , defines a
            //resizable bounds for the image
            SizedBox(
              height: 300.0,
              width: double.infinity,
              child: Image(
                image: AssetImage(widget.recipe.imageURL),
              ),
            ),
            // spacer SizedBox
            const SizedBox(
              height: 4.0,
            ),
            Text(
              widget.recipe.label,
              style: const TextStyle(fontSize: 18.0),
            ),
            // Expanded widget, which expands to fill the space in a Column
            Expanded(
              // A ListView , with one row per ingredient
              child: ListView.builder(
                padding: const EdgeInsets.all(7.0),
                itemCount: widget.recipe.ingredients.length,
                itemBuilder: (BuildContext context, int index) {
                  final ingredient = widget.recipe.ingredients[index];

                  return Text('''
                  ${ingredient.quantity * _sliderVal}', 
                  ${ingredient.measure}, 
                  ${ingredient.name},
                  ''');
                },
              ),
            ),
            // Slider presents a round thumb that can be dragged along a track
            //to change a value
            Slider(
              min: 1,
              max: 10,
              divisions: 10,
              label: '${_sliderVal * widget.recipe.servings} Servings',
              value: _sliderVal.toDouble(),
              onChanged: (newValue) {
                setState(() {
                  // uses round() to convert the double
                  //slider value back to an int
                  _sliderVal = newValue.round();
                });
              },
              activeColor: Colors.green,
              inactiveColor: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
