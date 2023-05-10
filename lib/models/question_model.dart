class Question {
  final int id;
  final int answer;
  final String question;
  final List<String> options;

  Question(
      {required this.id,
      required this.question,
      required this.options,
      required this.answer});

  Map<String, dynamic> toJson() => {
        'id': id,
        'answer': answer,
        'question': question,
        'options': options,
      };
}
