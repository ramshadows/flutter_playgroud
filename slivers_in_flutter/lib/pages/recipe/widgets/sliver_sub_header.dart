/*

While SliverAppBar is customizable, sometimes you need even more customization. 
Under the hood, SliverAppBar is a SliverPersistentHeader. 

This means you’ll find most of the properties that are in SliverAppBar in 
SliverPersistentHeader as well. SliverPersistentHeader takes a delegate class 
that extends the abstract class SliverPersistentHeaderDelegate.

### Implementing SliverPersistentHeaderDelegate ###


*/

import 'package:flutter/material.dart';
import 'package:slivers_in_flutter/constants/colors.dart';

// You built the delegate below. Now, you need to create your custom
// SliverPersistentHeader
class SliverSubHeader extends StatelessWidget {
  final String text;
  final Color backgroundColor;

  const SliverSubHeader({
    Key? key,
    required this.text,
    required this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // SliverSubHeader returns a SliverSubHeader with a custom configuration. 
    return SliverPersistentHeader(
      pinned: true,
      delegate: _SliverAppBarDelegate(
        minHeight: 40.0,
        maxHeight: 70.0,
        child: Container(
          color: backgroundColor,
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                color: AppColors.navy,
                fontSize: 23.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// _SliverAppBarDelegate is a private class that extends the abstract class
//SliverPersistentHeaderDelegate and overrides the implementation of
//minExtent and maxExtent.
class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  // The implementation of the build function only builds the expanded child
  // widget.
  @override
  Widget build(
    BuildContext context,
    double shrinkOffSet,
    bool overlapsContent,
  ) {
    return SizedBox.expand(
      child: child,
    );
  }

  // You also override shouldRebuild so it rebuilds when any of these three
  //properties change: maxHeight, minHeight or child.
  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
