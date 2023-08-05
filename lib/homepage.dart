import 'package:flutter/material.dart';
import 'package:quiz_project/quiz.dart';
import 'package:quiz_project/result.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore = _totalScore + score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions');
    }
  }

  final _questions = [
    {
      'questionText': 'What\'s your favourite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Blue', 'score': 8},
        {'text': 'Red', 'score': 6},
        {'text': 'White', 'score': 5},
      ],
    },
    {
      'questionText': "What's your favourite animal?",
      'answers': [
        {'text': 'Lion', 'score': 3},
        {'text': 'Horse', 'score': 2},
        {'text': 'Giraffe', 'score': 10},
        {'text': 'Dog', 'score': 7},
      ]
    },
    {
      'questionText': 'Who\'s your favourite actor?',
      'answers': [
        {'text': 'Ben', 'score': 7},
        {'text': 'Sam', 'score': 9},
        {'text': 'Lim', 'score': 5},
        {'text': 'Tam', 'score': 6},
      ]
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Quiz",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          elevation: 0.0,
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions)
            : Result(_totalScore, _resetQuiz));
  }
}
