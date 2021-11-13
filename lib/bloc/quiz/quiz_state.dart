import 'package:equatable/equatable.dart';
import 'package:islom_test/data/models/quiz_model.dart';

abstract class QuizState extends Equatable {
  const QuizState();

  @override
  List<Object> get props => [];
}

class QuizLoadInProgress extends QuizState {}

class QuizLoadSuccess extends QuizState {
  final List<QuizModel> quizzes;

  const QuizLoadSuccess(this.quizzes);

  @override
  List<Object> get props => [quizzes];

  @override
  String toString() => 'TodosLoadSuccess { todos: $quizzes }';
}

class QuizLoadFailure extends QuizState {
  final Object error;

  const QuizLoadFailure(this.error);

  @override
  List<Object> get props => [error];
}

class QuizStarted extends QuizState {
  final List<Map<String, String>> results;

  const QuizStarted(this.results);

  @override
  List<Object> get props => [results];
}
