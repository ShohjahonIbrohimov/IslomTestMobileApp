import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:islom_test/bloc/quiz/quiz_bloc.dart';
import 'package:islom_test/bloc/quiz/quiz_event.dart';
import 'package:islom_test/bloc/quiz/quiz_state.dart';
import 'package:islom_test/data/models/quiz_model.dart';
import 'package:islom_test/presentation/config/constants.dart';
import 'package:islom_test/presentation/config/size_config.dart';
import 'package:islom_test/presentation/widgets/general/default_button.dart';
import 'package:islom_test/presentation/widgets/test_process/answer_option.dart';
import 'package:islom_test/presentation/widgets/test_process/test_dots.dart';
import 'package:provider/src/provider.dart';

const optionTextStyle = TextStyle(fontSize: 17, color: textColor);

class TestContainer extends StatefulWidget {
  final List<QuizModel> quizzes;
  const TestContainer({Key? key, required this.quizzes}) : super(key: key);

  @override
  _TestContainerState createState() => _TestContainerState();
}

class _TestContainerState extends State<TestContainer> {
  late String? selectedOption;
  late bool checked;
  late List? answers = widget.quizzes[0].answers;
  late FlipCardController _controller0;
  late FlipCardController _controller1;
  late FlipCardController _controller2;
  late FlipCardController _controller3;
  late int currentQuestion;
  dynamic prevStoppedAt;

  @override
  void initState() {
    super.initState();
    _controller0 = FlipCardController();
    _controller1 = FlipCardController();
    _controller2 = FlipCardController();
    _controller3 = FlipCardController();
    selectedOption = null;
    checked = false;
    currentQuestion = 0;
    prevStoppedAt = -1;
    initAnswers();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      margin: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TestDots(
            currentQuestion: currentQuestion,
            answers: answers,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                widget.quizzes[currentQuestion].question,
                style: const TextStyle(fontSize: 23),
              ),
              const SizedBox(height: 40),
              ListView.separated(
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return AnswerOption(
                    controller: setController(index),
                    selectedOption: selectedOption,
                    setOption: setOption,
                    number: index.toString(),
                    optionText: Text(
                      answers![index],
                      style: optionTextStyle,
                    ),
                    answers: answers,
                    quiz: widget.quizzes[currentQuestion],
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(height: 20);
                },
                itemCount: answers!.length,
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: DefaultButton(
                  press: currentQuestion != 0 ? prevQuestion : null,
                  text: Icon(
                    Icons.arrow_back_ios,
                    color:
                        currentQuestion != 0 ? Colors.white : primaryColorLight,
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                flex: 2,
                child: DefaultButton(
                  press:
                      selectedOption != null && !checked ? checkAnswer : null,
                  text: Text(
                    'Tekshirish',
                    style: TextStyle(
                        fontSize: screenWidth(14),
                        fontWeight: FontWeight.bold,
                        color: selectedOption != null && !checked
                            ? Colors.white
                            : primaryColorLight),
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                flex: 1,
                child: DefaultButton(
                  press: checked ||
                          widget.quizzes[currentQuestion].selectedAnswer !=
                                  null &&
                              currentQuestion + 1 != widget.quizzes.length
                      ? nextQuestion
                      : null,
                  text: Icon(
                    Icons.arrow_forward_ios,
                    color: checked ||
                            widget.quizzes[currentQuestion].selectedAnswer !=
                                    null &&
                                currentQuestion + 1 != widget.quizzes.length
                        ? Colors.white
                        : primaryColorLight,
                  ),
                ),
              ),
            ],
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

  initAnswers() {
    for (var i = 0; i < widget.quizzes.length; i++) {
      widget.quizzes[i].answers.addAll(widget.quizzes[i].incorrectAnswers);
      widget.quizzes[i].answers.add(widget.quizzes[i].correctAnswer);
      widget.quizzes[i].answers.shuffle();
    }
  }

  setController(index) {
    switch (index) {
      case 0:
        return _controller0;
      case 1:
        return _controller1;
      case 2:
        return _controller2;
      default:
        return _controller3;
    }
  }

  toggleController() {
    switch (selectedOption) {
      case '0':
        _controller0.toggleCard();
        break;
      case '1':
        _controller1.toggleCard();
        break;
      case '2':
        _controller2.toggleCard();
        break;
      default:
        _controller3.toggleCard();
        break;
    }
  }

  toggelCorrectAnswer() {
    final correctAnswer = widget.quizzes[currentQuestion].correctAnswer;
    if (answers![0] == correctAnswer) {
      _controller0.toggleCard();
    } else if (answers![1] == correctAnswer) {
      _controller1.toggleCard();
    } else if (answers![2] == correctAnswer) {
      _controller2.toggleCard();
    } else {
      _controller3.toggleCard();
    }
  }

  nextQuestion() {
    if (currentQuestion >= prevStoppedAt) {
      toggleController();
      toggelCorrectAnswer();
    }

    setState(() {
      if (prevStoppedAt == currentQuestion) {
        prevStoppedAt = -1;
      }

      currentQuestion += 1;
      selectedOption = null;
      answers = widget.quizzes[currentQuestion].answers;
      checked = false;
    });
    // print(object)
  }

  prevQuestion() {
    print(prevStoppedAt);
    setState(() {
      if (prevStoppedAt < 0) {
        prevStoppedAt = currentQuestion;
      }
      currentQuestion -= 1;
      selectedOption = null;
      answers = widget.quizzes[currentQuestion].answers;
    });
  }

  checkAnswer() {
    widget.quizzes[currentQuestion].selectedAnswer = selectedOption;
    toggleController();
    toggelCorrectAnswer();
    setState(() {
      checked = true;
    });
  }
}

// selectedOption/ currentQuestion / answers
// answers[number] == quizzes[currentQuestion][selectedOption].correctAnswer