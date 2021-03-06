import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int _questionIndex = 0;
  int _totalScore = 0;

  final List<Map<String, dynamic>> _questions = const [
    {
      "questionText": "What's your favorite color?",
      "answers": [
        {'text': "Blue", "score": 2},
        {'text': "Black", "score": 10},
        {'text': "Red", "score": 5},
        {'text': "White", "score": 1},
      ],
    },
    {
      "questionText": "What's your favorite animal?",
      "answers": [
        {'text': "Rabbit", "score": 7},
        {'text': "Lion", "score": 1},
        {'text': "Snake", "score": 10},
        {'text': "Tiger", "score": 4},
      ],
    },
    {
      "questionText": "What's your favorite game?",
      "answers": [
        {'text': "DMC", "score": 10},
        {'text': "Spiderman", "score": 3},
        {'text': "Witcher", "score": 7},
        {'text': "GTA", "score": 1},
      ],
    },
  ];

  void _answerQuestion(int score) {
    if (_questionIndex < _questions.length) {
      setState(() {
        _totalScore += score;
        _questionIndex += 1;
      });
    }
  }

  void resetQuiz() {
    setState(() {
      _totalScore = 0;
      _questionIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _questionIndex < _questions.length
        ? Quiz(
            questions: _questions,
            questionIndex: _questionIndex,
            answerQuestion: _answerQuestion,
          )
        : Result(
            totalScore: _totalScore,
            resetQuiz: resetQuiz,
          );
  }
}
