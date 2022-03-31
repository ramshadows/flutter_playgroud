/*
Adds a cool scrollable app bar. Use slivers to customize 
app bar with behavior different from Flutter’s default AppBar widget.
 */

import 'package:flutter/material.dart';
import 'package:slivers_in_flutter/constants/colors.dart';
import 'package:slivers_in_flutter/shared_widgets/image_with_top_shadow_widget.dart';

class AppBarWidget extends StatelessWidget {
  final String text;
  final String imagePath;
  final bool centerTitle;

  const AppBarWidget({
    Key? key,
    required this.text,
    required this.imagePath,
    this.centerTitle = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // SliverAppBar is a scrollable app bar.
    return SliverAppBar(
      title: Text(
        text,
        style: const TextStyle(
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: AppColors.navy,
      centerTitle: centerTitle,
      // expandedHeight to set the app bar’s size when it’s fully expanded. 
      //By setting the value here, you make the app bar scrollable.
      expandedHeight: 200.0,
      //pinned set to true - lets the app bar remain visible at the start of 
      //the scroll view.
      pinned: true,
      elevation: 0,
      // adds an image with a shadow widget stacked behind the toolbar and the 
      //tab bar. By adding it to FlexibleSpaceBar, you set its height to the 
      //same as the app bar’s overall height.
      flexibleSpace: FlexibleSpaceBar(
        background: ImageWithTopShadowWidget(imagePath),
      ),
    );
  }
}


/*

SliverAppBar has three Booleans in its configuration. When you change them, 
you alter the behavior of the app bar when scrolling:

    pinned: When set to true, the app bar will remain visible as the user 
    scrolls.

    floating: By setting it to true, you make the app bar visible as soon as 
    the user scrolls towards the app bar. Otherwise, they’ll need to scroll 
    near the top of the scroll view to reveal the app bar.

    snap: When true, the app bar will fully expand as you scroll, which is 
    helpful when you have a text field in the app bar.



*/