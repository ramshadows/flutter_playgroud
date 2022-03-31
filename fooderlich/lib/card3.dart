import 'package:flutter/material.dart';
import 'package:fooderlich/fooderlich_theme.dart';

class Card3 extends StatelessWidget {
  const Card3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints.expand(
          height: 350,
          width: 450,
        ),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/mag3.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: <Widget>[
            // adds dark overlay BoxDecoration color overlay with a 60% '
            // semi-transparent background to make the image appear darker.
            //This gives the appearance of rounded image corners
            Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.6),
                borderRadius: const BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
            ),

            Container(
              padding: const EdgeInsetsDirectional.all(16.0),
              // Column lay out the widgets vertically
              child: Column(
                // Position all the widgets to the left of the column
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Icon(
                    Icons.book,
                    color: Colors.white,
                    size: 40.0,
                  ),
                  // Apply an 8-pixel space vertically
                  const SizedBox(height: 8.0),
                  Text(
                    'Recipe Trends',
                    style: FooderlichTheme.darkTextTheme.headline2,
                  ),
                  //Apply an 30-pixel space vertically
                  const SizedBox(
                    height: 30.0,
                  ),
                ],
              ),
            ),

            Center(
              child: Wrap(
                //Place the children as close to the left, i.e. the start ,
                //as possible.
                alignment: WrapAlignment.start,
                // Apply a 12-pixel space between each child.
                spacing: 12.0,
                children: <Widget>[
                  Chip(
                    label: Text(
                      'Health',
                      style: FooderlichTheme.darkTextTheme.bodyText1,
                    ),
                    backgroundColor: Colors.black.withOpacity(0.7),
                    // ignore: avoid_print
                    onDeleted: () => print('Delete'),
                  ),
                  Chip(
                    label: Text(
                      'Vegan',
                      style: FooderlichTheme.darkTextTheme.bodyText1,
                    ),
                    backgroundColor: Colors.black.withOpacity(0.7),
                    // ignore: avoid_print
                    onDeleted: () => print('Delete'),
                  ),
                  Chip(
                    label: Text(
                      'Carrots',
                      style: FooderlichTheme.darkTextTheme.bodyText1,
                    ),
                    backgroundColor: Colors.black.withOpacity(0.7),
                    // ignore: avoid_print
                    onDeleted: () => print('Delete'),
                  ),
                  Chip(
                    label: Text(
                      'Chicken',
                      style: FooderlichTheme.darkTextTheme.bodyText1,
                    ),
                    backgroundColor: Colors.black.withOpacity(0.7),
                    // ignore: avoid_print
                    onDeleted: () => print('Delete'),
                  ),
                  Chip(
                    label: Text(
                      'Beef',
                      style: FooderlichTheme.darkTextTheme.bodyText1,
                    ),
                    backgroundColor: Colors.black.withOpacity(0.7),
                    // ignore: avoid_print
                    onDeleted: () => print('Delete'),
                  ),
                  Chip(
                    label: Text(
                      'Greens',
                      style: FooderlichTheme.darkTextTheme.bodyText1,
                    ),
                    backgroundColor: Colors.black.withOpacity(0.7),
                    // ignore: avoid_print
                    onDeleted: () => print('Delete'),
                  ),
                  Chip(
                    label: Text(
                      'Diary',
                      style: FooderlichTheme.darkTextTheme.bodyText1,
                    ),
                    backgroundColor: Colors.black.withOpacity(0.7),
                    // ignore: avoid_print
                    onDeleted: () => print('Delete'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
