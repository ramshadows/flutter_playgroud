class QuestionAnswer {
  final List<Map<String, Object>> questions = const [
    {
      'questionText': 'What\'s Your favorite muffins?',
      'answers': ['English', 'Choco', 'Plain'],
    },
    {
      'questionText': 'What\'s Your favorite meal?',
      'answers': ['Choma Ugali', 'Fish Ugali', 'Chicken Deep Fry + Chips'],
    },
    {
      'questionText': 'What\'s Your favorite chicken dish?',
      'answers': ['Deep Fry', 'Grilled', 'Curry'],
    },
    {
      'questionText': 'What\'s Your favorite soda?',
      'answers': ['Krest', 'Coke', 'Fanta'],
    },
    {
      'questionText': 'What\'s Your favorite pizza?',
      'answers': ['Pepporini', 'Martin', 'Plain'],
    },
    {
      'questionText': 'What\'s Your favorite coffee?',
      'answers': ['Nescafe', 'Dormant', 'Cupentino'],
    },
  ];

  String getQuestionList(int index, String mapKey) {
    var questionList = questions[index][mapKey];

    return questionList.toString();
  }

  List<String> getAnswerList(int index, String mapKey) {
    var answerList = questions[index][mapKey] as List<String>;

    return answerList;
  }
}
