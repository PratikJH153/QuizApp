import 'package:flutter/material.dart';
import './answer.dart';
import './question.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Quiz App",
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _questionIndex = 0;

  final List<Map<String, dynamic>> _questions = const [
    {
      "questionText": "What's your favorite color?",
      "answers": ["Blue", "Black", "Red", "White"],
    },
    {
      "questionText": "What's your favorite animal?",
      "answers": ["Rabbit", "Lion", "Snake", "Tiger"],
    },
    {
      "questionText": "What's your favorite game?",
      "answers": ["DMC", "Spiderman", "Witcher", "GTA"],
    },
  ];

  void _answerQuestion() {
    if (_questionIndex < _questions.length) {
      setState(() {
        _questionIndex += 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quiz App"),
      ),
      body: _questionIndex < _questions.length
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Question(
                  _questions[_questionIndex]["questionText"],
                ),
                ...(_questions[_questionIndex]["answers"] as List<String>)
                    .map((answer) {
                  return Answer(
                    selectHandler: _answerQuestion,
                    answerText: answer,
                  );
                }).toList()
              ],
            )
          : const Center(
              child: Text("ALL DONE!"),
            ),
    );
  }
}
