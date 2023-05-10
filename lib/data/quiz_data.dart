import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import '../models/question_model.dart';

class QuizData with ChangeNotifier {
  List<Question>? questions;

  static Question fromJson(Map<String, dynamic> json) => Question(
        id: json['id'],
        question: json['question'],
        options: List<String>.from(json['options']),
        answer: json['answer'],
      );

  static Map<String, dynamic> toJson(Question question) => {
        'id': question.id,
        'question': question.question,
        'options': question.options,
        'answer': question.answer,
      };

  List<Map<String, dynamic>> questionList = [
    {
      "id": 1,
      "question": "What is the capital city of France?",
      "options": ["London", "Paris", "Berlin", "Madrid"],
      "answer": 1
    },
    {
      "id": 2,
      "question": "What is the largest planet in our solar system?",
      "options": ["Venus", "Mars", "Jupiter", "Saturn"],
      "answer": 2
    },
    {
      "id": 3,
      "question": "Who directed the movie Inception?",
      "options": [
        "Christopher Nolan",
        "Steven Spielberg",
        "Quentin Tarantino",
        "Martin Scorsese"
      ],
      "answer": 0
    },
    {
      "id": 4,
      "question": "What is the chemical symbol for gold?",
      "options": ["Ag", "Au", "Fe", "Cu"],
      "answer": 1
    },
    {
      "id": 5,
      "question": "Which country won the 2018 FIFA World Cup?",
      "options": ["Brazil", "Argentina", "France", "Germany"],
      "answer": 2
    }
  ];

  static Future<List<String>> getQuizDataIds() async {
    List<String> docIDs = [];

    await FirebaseFirestore.instance
        .collection('questions')
        .get()
        .then((snapshot) {
      for (var document in snapshot.docs) {
        docIDs.add(document.reference.id);
      }
    });

    return docIDs;
  }

  Future<List<Question>> getQuizData() async {
    var ids = await getQuizDataIds();
    var questions = <Question>[];

    await Future.wait(
      ids.map((docId) async {
        var snapshot = await FirebaseFirestore.instance
            .collection('questions')
            .doc(docId)
            .get();

        if (snapshot.exists) {
          var data = snapshot.data()!;
          final finalData = QuizData.fromJson(data);
          questions.add(finalData);
        } else {
          throw Exception('Failed to load quiz data');
        }
      }),
    );

    this.questions = questions;
    notifyListeners();

    return questions;
  }

  addQuestion() async {
    for (var jsonQuestion in questionList) {
      Question question = QuizData.fromJson(jsonQuestion);
      await FirebaseFirestore.instance
          .collection('questions')
          .doc()
          .set(QuizData.toJson(question));
    }
  }
}
