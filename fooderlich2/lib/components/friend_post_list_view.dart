import 'package:flutter/material.dart';
import 'package:fooderlich2/components/friend_post_tile.dart';
import 'package:fooderlich2/models/models.dart';

class FriendPostListView extends StatelessWidget {
  // FriendPostListView requires a list of Post s
  final List<Post> friendPosts;
  const FriendPostListView({
    Key? key,
    required this.friendPosts,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16.0,
        right: 16.0,
        top: 0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Socio Chefs',
            style: Theme.of(context).textTheme.headline1,
          ),
          const SizedBox(height: 16),
          // Create ListView.separated with two IndexWidgetBuilder callbacks
          ListView.separated(
            /* 
            Since you’re nesting two list views, it’s a good idea to set 
            primary to false. That lets Flutter know that this isn’t 
            the primary scroll view.
            
            */
            primary: false,
            /* 
            Set the scrolling physics to NeverScrollableScrollPhysics . 
            Even though you set primary to false, it’s also a good idea 
            to disable the scrolling for this list view. That will propagate 
            up to the parent list view.
            
            */
            physics: const NeverScrollableScrollPhysics(),
            /* 
            Set shrinkWrap to true to create a fixed-length scrollable 
            list of items. This gives it a fixed height. If this were false, 
            you’d get an unbounded height error.
            
            */
            shrinkWrap: true,
            itemCount: friendPosts.length,
            // For every item in the list, create a FriendPostTile
            itemBuilder: (context, index) {
              return FriendPostTile(
                post: friendPosts[index],
              );
            },
            // For every item, also create a SizedBox to space each item by 
            //16 points.
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 16.0,
              );
            },
          ),

          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
