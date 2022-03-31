import 'package:flutter/material.dart';

class NextQuestionButton extends StatelessWidget {
  final VoidCallback selectedQuizHandler;

  NextQuestionButton(this.selectedQuizHandler);
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: selectedQuizHandler,
      tooltip: 'Next Question',
      child: Icon(Icons.forward),
      highlightElevation: 20.0,
    );
  }
}
