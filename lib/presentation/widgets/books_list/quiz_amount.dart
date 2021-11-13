import 'package:flutter/material.dart';
import 'package:islom_test/presentation/config/constants.dart';
import 'package:islom_test/presentation/widgets/books_list/quiz_number_option.dart';
import 'package:islom_test/presentation/widgets/test_process/answer_option.dart';

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
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: QuizNumberOption(
              selectedOption: selectedOption,
              setOption: setOption,
              number: '0',
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
              number: '1',
              optionText:  const Align(
                alignment: Alignment.center,
                child: Text(
                  '10',
                  style: textStyle,
                ),
              )
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            flex: 1,
            child: QuizNumberOption(
              selectedOption: selectedOption,
              setOption: setOption,
              number: '2',
              optionText: const Align(
                alignment: Alignment.center,
                child: Text(
                  '15',
                  style: textStyle,
                ),
              )
            ),
          ),
        ],
      ),
    );
  }

  void setOption(option) {
    setState(() {
      selectedOption = option;
    });
  }
}
