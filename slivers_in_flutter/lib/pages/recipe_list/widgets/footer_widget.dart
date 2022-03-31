

import 'package:flutter/material.dart';

import '../../../constants/colors.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RichText(
          text: const TextSpan(
            style: TextStyle(color: AppColors.navy, fontSize: 30),
            children: <TextSpan>[
              TextSpan(text: 'Made with ❤️ by '),
              TextSpan(
                  text: 'RAM',
                  style: TextStyle(color: AppColors.darkGreen)),
            ],
          ),
          textScaleFactor: 0.5,
        ),
        const SizedBox(height: 50),
      ],
    );
  }
}
