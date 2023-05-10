import 'package:flutter/material.dart';

Widget showCounter(BuildContext context, String currentScore,
    String personalBest, String currentQuestion, String totalQuestions) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(left: 12.0),
        child: Card(
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Score : $currentScore\t\t Best : $personalBest',
              style:
                  const TextStyle(fontWeight: FontWeight.w600, fontSize: 16.0),
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 12.0),
        child: Card(
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Questions : $currentQuestion/$totalQuestions',
              style:
                  const TextStyle(fontWeight: FontWeight.w600, fontSize: 16.0),
            ),
          ),
        ),
      ),
    ],
  );
}
