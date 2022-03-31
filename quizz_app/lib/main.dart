import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:quizz_app/answers.dart';
import 'package:quizz_app/question.dart';
import 'package:quizz_app/nextQuestionButton.dart';
import 'package:quizz_app/question_Answer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _questionIndex = 0;
  final questionAnswer = QuestionAnswer();

  @override
  Widget build(BuildContext context) {
    void _questionList() {
      setState(() {
        _questionIndex += 1;
      });
    }

    var questionText =
        questionAnswer.getQuestionList(_questionIndex, 'questionText');
    var answerList = questionAnswer.getAnswerList(_questionIndex, 'answers');

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Quiz App',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
        canvasColor: Colors.lightGreen.shade300,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lime,
          leading: IconButton(
            onPressed: null,
            icon: Icon(Icons.menu),
          ),
          centerTitle: true,
          title: Text(
            'Quiz App',
          ),
          actions: <Widget>[
            IconButton(
              onPressed: null,
              icon: Icon(Icons.search),
            ),
            IconButton(
              onPressed: null,
              icon: Icon(Icons.more_vert),
            ),
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  Text(
                    'Question',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Divider(),
                  Question(questionText),
                  AnswersRadioListTiles(answerList),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: NextQuestionButton(_questionList),
      ),
    );
  }
}
