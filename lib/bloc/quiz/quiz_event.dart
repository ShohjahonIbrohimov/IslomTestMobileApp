import 'package:equatable/equatable.dart';
import 'package:islom_test/data/models/quiz_model.dart';

abstract class QuizEvent extends Equatable {
  const QuizEvent();

  @override
  List<Object> get props => [];
}

class StartQuiz extends QuizEvent {
  int amount;

  StartQuiz(this.amount);
}


// class AnswerSelected extends QuizEvent {
//   Map<String,String> results;

//   AnswerSelected(this.selectedAnswer);
// }

