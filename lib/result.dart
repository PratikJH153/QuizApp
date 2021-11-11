import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int totalScore;
  final VoidCallback resetQuiz;

  const Result({
    required this.totalScore,
    required this.resetQuiz,
    Key? key,
  }) : super(key: key);

  String get resultText {
    if (totalScore <= 8) {
      return 'You are awesome and innocent';
    } else if (totalScore <= 12) {
      return 'Pretty likeable';
    } else if (totalScore <= 16) {
      return 'You are strange';
    } else {
      return 'You are so bad';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          resultText,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextButton(
          onPressed: resetQuiz,
          child: const Text("Reset Quiz"),
        ),
      ],
    );
  }
}
