import 'package:flutter/material.dart';

class CircleImage extends StatelessWidget {
  final double imageRadius;
  final ImageProvider? imageProvider;

  const CircleImage({Key? key, this.imageRadius = 20.0, this.imageProvider})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Within the outer circle is another CircleAvatar , which is a smaller 
    //circle that includes the user’s profile image. Making the inner circle 
    //smaller gives you the white border effect.
    return CircleAvatar(
      backgroundColor: Colors.white,
      radius: imageRadius,
      child: CircleAvatar(
        backgroundImage: imageProvider,
        radius: imageRadius - 5,
      ),
    );
  }
}
