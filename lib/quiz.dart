import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, dynamic>> questions;
  final int questionIndex;
  final Function answerQuestion;

  const Quiz({
    required this.questions,
    required this.questionIndex,
    required this.answerQuestion,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Question(
          questions[questionIndex]["questionText"],
        ),
        ...(questions[questionIndex]["answers"] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(
            selectHandler: () => answerQuestion(answer["score"] as int),
            answerText: answer["text"] as String,
          );
        }).toList()
      ],
    );
  }
}
