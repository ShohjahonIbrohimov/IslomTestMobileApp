import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islom_test/bloc/quiz/quiz_bloc.dart';
import 'package:islom_test/bloc/quiz/quiz_state.dart';
import 'package:islom_test/presentation/config/constants.dart';

class TestDots extends StatelessWidget {
  final int currentQuestion;
  final List? answers;
  const TestDots({Key? key, required this.currentQuestion, this.answers})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizBloc, QuizState>(
      builder: (context, state) {
        if (state is QuizLoadSuccess) {
          return Container(
            width: double.infinity,
            child: Wrap(
              direction: Axis.horizontal,
              children: [
                Container(
                  height: 40,
                  child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      final num = index + 1;
                      return Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              currentQuestion != index
                                  ? primaryColorLight
                                  : gradientColor1,
                              currentQuestion != index
                                  ? primaryColorLight
                                  : gradientColor2,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(
                            50.0,
                          ),
                          border: Border.all(
                            width: 1,
                            color: dotBorderColor(index, state),
                          ),
                        ),
                        child: Align(
                            alignment: Alignment.center,
                            child: Text(num.toString())),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(width: 10);
                    },
                    itemCount: state.quizzes.length,
                  ),
                ),
              ],
            ),
          );
        }
        return const Text('');
      },
    );
  }

  Color dotBorderColor(index, state) {
    final current = state.quizzes[index];
    if (current.selectedAnswer != null) {
      return current.answers[int.parse(current.selectedAnswer)] ==
              current.correctAnswer
          ? greenColor
          : redColor;
    } else {
      return primaryColorExtraLight;
    }
  }
}
