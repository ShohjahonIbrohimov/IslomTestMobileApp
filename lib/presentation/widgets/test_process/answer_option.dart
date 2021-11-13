import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:islom_test/data/models/quiz_model.dart';
import 'package:islom_test/presentation/config/constants.dart';

class AnswerOption extends StatelessWidget {
  Widget optionText;
  String? number;
  String? selectedOption;
  Function setOption;
  FlipCardController? controller;
  List? answers;
  QuizModel? quiz;


  AnswerOption({
    Key? key,
    required this.optionText,
    required this.number,
    required this.setOption,
    required this.selectedOption,
    this.controller,
    this.answers,
    this.quiz
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setOption(number);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        child: FlipCard(
          flipOnTouch: false,
          controller: controller,
          direction: FlipDirection.VERTICAL,
          front: Container(
            constraints: const BoxConstraints(minHeight: 80),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFF595f93)),
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                 selectedOption != number ? primaryColorLight : gradientColor1,
                  selectedOption != number ? primaryColorLight : gradientColor2,
                ],
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            child: optionText,
          ),
           back: Container(
            constraints: const BoxConstraints(minHeight: 80),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFF595f93)),
              color: answers![int.parse(number!)] == quiz!.correctAnswer ? Colors.green : Colors.red,
              borderRadius: const BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            child: optionText,
          ),
        ),
      ),
    );
  }
}
