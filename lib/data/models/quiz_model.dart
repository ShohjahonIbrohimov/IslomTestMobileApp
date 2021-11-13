import 'dart:ffi';

class QuizModel {
  final String category;
  final String difficulty;
  final String question;
  final String correctAnswer;
  final List incorrectAnswers;
  String? selectedAnswer;
  List answers;

  QuizModel(this.category, this.difficulty, this.question, this.correctAnswer,
      this.incorrectAnswers, this.selectedAnswer, this.answers);

  factory QuizModel.fromJson(Map<String, dynamic> json) {
    return QuizModel(
      json["category"],
      json["difficulty"],
      json["question"],
      json["correct_answer"],
      json["incorrect_answers"],
      null,
      [],
    );
  }
}
