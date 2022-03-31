import 'package:flutter/material.dart';
import 'package:fooderlich/circular_avatar.dart';
import 'package:fooderlich/fooderlich_theme.dart';

class AuthorCard extends StatefulWidget {
  final String authorName;
  final String title;
  final ImageProvider? imageProvider;

  const AuthorCard(
      {Key? key,
      required this.authorName,
      required this.title,
      this.imageProvider})
      : super(key: key);

  @override
  State<AuthorCard> createState() => _AuthorCardState();
}

class _AuthorCardState extends State<AuthorCard> {
  bool _isFavorited = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //Inner Row groups the CircleImage and the author’s Text information
        Row(
          children: <Widget>[
            CircleImage(
              imageProvider: widget.imageProvider,
              imageRadius: 28.0,
            ),
            const SizedBox(
              width: 8,
            ),
            //The Column lays out the author’s name and job title vertically
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  widget.authorName,
                  style: FooderlichTheme.lightTextTheme.headline2,
                ),
                Text(
                  widget.title,
                  style: FooderlichTheme.lightTextTheme.headline3,
                ),
              ],
            ),
          ],
        ),
        IconButton(
          icon: Icon(
            _isFavorited ? Icons.favorite : Icons.favorite_border,
          ),
          iconSize: 30.0,
          color: Colors.grey[400],
          onPressed: () {
            setState(() {
              _isFavorited = !_isFavorited;
            });
            const snackBar = SnackBar(
              content: Text('Favourite selected'),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
        ),
      ],
    );
  }
}
