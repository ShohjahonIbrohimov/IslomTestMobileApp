import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:islom_test/bloc/quiz/quiz_event.dart';
import 'package:islom_test/bloc/quiz/quiz_state.dart';
import 'package:islom_test/data/providers/quiz_provider.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  QuizBloc() : super(QuizLoadInProgress());

  @override
  Stream<QuizState> mapEventToState(QuizEvent event) async* {
    if (event is StartQuiz) {
      yield* _mapTodosLoadedToState(event.amount);
    }
  }

  Stream<QuizState> _mapTodosLoadedToState(amount) async* {
    yield QuizLoadInProgress();
    try {
      final quizzes = await fetchQuizzes(amount);
      print(quizzes[0]);
      yield QuizLoadSuccess(quizzes);
    } catch (err) {
      yield QuizLoadFailure(err);
    }
  }
}
