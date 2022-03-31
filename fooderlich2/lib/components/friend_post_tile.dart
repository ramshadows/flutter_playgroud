//Creates the items for the list view to display
//Build a vertical list view to display them

// Note: There’s no height restriction on FriendPostTile . 
//That means the text can expand to many lines as long as it’s in a scroll view!

import 'package:flutter/material.dart';
import 'package:fooderlich2/components/components.dart';
import 'package:fooderlich2/models/models.dart';

class FriendPostTile extends StatelessWidget {
  final Post post;
  const FriendPostTile({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Row to arrange the widgets horizontally
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        // circular avatar, which displays the image asset associated
        //with the post
        CircleImage(
          imageProvider: AssetImage(post.profileImageUrl),
          imageRadius: 20.0,
        ),
        // Apply a 16-point padding
        const SizedBox(
          width: 16.0,
        ),
        // Create Expanded , which makes the children fill the rest of the 
        // container
        Expanded(
          // Establish a Column to arrange the widgets vertically
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Create a Text to display your friend’s comments.
              Text(post.comment),
              // Create another Text to display the timestamp of a post.
              Text(
                '${post.timestamp} mins ago',
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
