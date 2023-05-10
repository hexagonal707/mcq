import 'package:flutter/material.dart';
import 'package:mcq/widgets/options_card.dart';
import 'package:provider/provider.dart';

import '../../data/quiz_data.dart';
import '../../widgets/counter_card.dart';
import '../../widgets/question_card.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int currentQuestionIndex = 0;
  bool quizEnded = false;
  Color? color;
  int? selectedAnswerIndex;

  @override
  Widget build(BuildContext context) {
    return Consumer<QuizData>(builder: (context, quizProvider, child) {
      if (quizProvider.questions == null || quizProvider.questions!.isEmpty) {
        return const Center(child: CircularProgressIndicator());
      }

      var question = quizProvider.questions![currentQuestionIndex];

      return Scaffold(
        appBar: AppBar(),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                //Counter
                showCounter(context, '10', '20', '1', '10'),
                //Question
                showQuestion(context, question.question),

                for (int i = 0; i < question.options.length; i++)
                  showOptions(
                      context,
                      i,
                      question.options[i],
                      i == selectedAnswerIndex
                          ? color
                          : Theme.of(context).cardColor, (int index) {
                    selectedAnswerIndex = index;
                    if (selectedAnswerIndex != question.answer) {
                      color = Colors.red;
                    } else {
                      color = Colors.green;
                    }
                    setState(() {});
                  }),

                // Next/Finish Button
                quizEnded
                    ? FilledButton(
                        onPressed: () {}, child: const Text('Finish'))
                    : FilledButton(
                        onPressed: () {
                          if (currentQuestionIndex ==
                              quizProvider.questions!.length - 1) {
                            setState(() {
                              quizEnded = true;
                            });
                          } else {
                            setState(() {
                              currentQuestionIndex++;
                              selectedAnswerIndex = null;
                            });
                          }
                        },
                        child: const Text('Next'),
                      ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
