import 'package:flutter/material.dart';

class AnswersRadioListTiles extends StatefulWidget {
  const AnswersRadioListTiles(
    this.answerList,
  );

  final List<String> answerList;

  @override
  _AnswersRadioListTilesState createState() => _AnswersRadioListTilesState();
}

class _AnswersRadioListTilesState extends State<AnswersRadioListTiles> {
  int selectedRadio = 0;
  int selectedRadioTile = 0;
  String selectedAnswer = '';

  @override
  void initState() {
    super.initState();
    selectedRadio = 0;
    selectedRadioTile = 0;
  }

  setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
    });
  }

  setSelectedRadioTile(int val) {
    setState(() {
      selectedRadioTile = val;
    });
  }

  setSelectedUser(var answer) {
    setState(() {
      selectedAnswer = answer;
    });
  }

  List<Widget> createAnswersRadioList() {
    List<Widget> widgets = [];

    widget.answerList.forEach(
      (answer) {
        widgets.add(
          RadioListTile(
            value: answer,
            groupValue: selectedAnswer,
            title: Text(answer),
            onChanged: (currentAnswer) {
              setSelectedUser(currentAnswer);
            },
            selected: selectedAnswer == answer,
            activeColor: Colors.green,
            toggleable: true,
          ),
        );
      },
    );

    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: createAnswersRadioList(),
      ),
    );
  }
}
