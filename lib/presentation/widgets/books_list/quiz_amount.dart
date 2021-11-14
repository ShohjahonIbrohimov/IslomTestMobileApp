import 'package:flutter/material.dart';
import 'package:islom_test/bloc/quiz/quiz_bloc.dart';
import 'package:islom_test/bloc/quiz/quiz_event.dart';
import 'package:islom_test/presentation/config/constants.dart';
import 'package:islom_test/presentation/config/size_config.dart';
import 'package:islom_test/presentation/widgets/books_list/quiz_number_option.dart';
import 'package:islom_test/presentation/widgets/general/default_button.dart';
import 'package:islom_test/presentation/widgets/test_process/answer_option.dart';
import 'package:provider/src/provider.dart';

const textStyle = TextStyle(fontSize: 25, color: textColor);

class QuizAmount extends StatefulWidget {
  const QuizAmount({Key? key}) : super(key: key);

  @override
  _QuizAmountState createState() => _QuizAmountState();
}

class _QuizAmountState extends State<QuizAmount> {
  String? selectedOption;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: QuizNumberOption(
                selectedOption: selectedOption,
                setOption: setOption,
                number: '5',
                optionText: const Align(
                  alignment: Alignment.center,
                  child: Text(
                    '5',
                    style: textStyle,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              flex: 1,
              child: QuizNumberOption(
                  selectedOption: selectedOption,
                  setOption: setOption,
                  number: '10',
                  optionText: const Align(
                    alignment: Alignment.center,
                    child: Text(
                      '10',
                      style: textStyle,
                    ),
                  )),
            ),
            const SizedBox(width: 10),
            Expanded(
              flex: 1,
              child: QuizNumberOption(
                  selectedOption: selectedOption,
                  setOption: setOption,
                  number: '15',
                  optionText: const Align(
                    alignment: Alignment.center,
                    child: Text(
                      '15',
                      style: textStyle,
                    ),
                  )),
            ),
          ],
        ),
        const SizedBox(height: 30),
        DefaultButton(
          text: Text(
            'Boshlash',
            style: TextStyle(
                fontSize: screenWidth(14), fontWeight: FontWeight.bold),
          ),
          press: () {
            context.read<QuizBloc>().add(StartQuiz(int.parse(selectedOption!)));
            Navigator.pushNamed(context, '/test');
          },
        )
      ],
    );
  }

  void setOption(option) {
    setState(() {
      selectedOption = option;
    });
  }
}
