import 'package:flutter/material.dart';

// pages
import "quiz.dart";
import "result.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      "questionText": "What is my favorite color?",
      "answers": [
        {"text": "Black", "score": 4},
        {"text": "Green", "score": 10},
        {"text": "Yellow", "score": 2},
        {"text": "Blue", "score": 6},
      ],
    },
    {
      "questionText": "What is my favorite fruite?",
      "answers": [
        {"text": "Banana", "score": 10},
        {"text": "Apple", "score": 5},
        {"text": "Orange", "score": 8},
        {"text": "Strawberry", "score": 2},
      ],
    },
    {
      "questionText": "What is my favorite animal?",
      "answers": [
        {"text": "Cat", "score": 4},
        {"text": "Horse", "score": 10},
        {"text": "Bird", "score": 2},
        {"text": "Dog", "score": 6},
      ],
    },
    {
      "questionText": "What is my favorite TV series?",
      "answers": [
        {"text": "Prison Break", "score": 10},
        {"text": "Vikings", "score": 8},
        {"text": "Game of Thrones", "score": 6},
        {"text": "The Flash", "score": 4},
      ],
    },
    {
      "questionText": "What is my favorite car?",
      "answers": [
        {"text": "Audi", "score": 7},
        {"text": "Bugatti", "score": 2},
        {"text": "BMW", "score": 5},
        {"text": "Mercedes", "score": 10},
      ],
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    setState(() {
      _questionIndex = _questionIndex + 1;
      _totalScore = _totalScore + score;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print("we have more questions");
    } else {
      print("No more question");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Furkan\'s Quiz '),
          centerTitle: true,
          backgroundColor: Colors.purple,
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
