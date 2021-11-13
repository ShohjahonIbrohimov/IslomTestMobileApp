import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islom_test/bloc/quiz/quiz_bloc.dart';
import 'package:islom_test/bloc/quiz/quiz_state.dart';
import 'package:islom_test/presentation/widgets/general/loader.dart';
import 'package:islom_test/presentation/widgets/test_process/test_container.dart';

class TestProcessMain extends StatelessWidget {
  const TestProcessMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizBloc, QuizState>(
      builder: (context, state) {
        if (state is QuizLoadInProgress) {
          return const Loader();
        } else if (state is QuizLoadSuccess) {
          return TestContainer(quizzes: state.quizzes);
        } else if (state is QuizLoadFailure) {
          return Center(
            child: Text(
              state.error.toString(),
              style: TextStyle(fontSize: 18),
            ),
          );
        }
        return const Text('');
      },
    );
  }
}
