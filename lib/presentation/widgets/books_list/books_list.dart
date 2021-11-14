import 'package:flutter/material.dart';
import 'package:islom_test/bloc/quiz/quiz_bloc.dart';
import 'package:islom_test/bloc/quiz/quiz_event.dart';
import 'package:islom_test/presentation/config/constants.dart';
import 'package:islom_test/presentation/config/size_config.dart';
import 'package:islom_test/presentation/screens/test_screen.dart';
import 'package:islom_test/presentation/widgets/books_list/book_card.dart';
import 'package:islom_test/presentation/widgets/books_list/quiz_amount.dart';
import 'package:islom_test/presentation/widgets/general/default_button.dart';
import 'package:provider/src/provider.dart';

class BooksList extends StatefulWidget {
  const BooksList({Key? key}) : super(key: key);

  @override
  _BooksListState createState() => _BooksListState();
}

class _BooksListState extends State<BooksList> {
  String? selectedOption;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2.9;
    final double itemWidth = size.width / 2;
    SizeConfig().init(context);

    return GridView.count(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      childAspectRatio: (itemWidth / itemHeight),
      primary: false,
      padding: const EdgeInsets.all(20),
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      crossAxisCount: 2,
      children: <Widget>[
        GestureDetector(
          onTap: () {
            _onTopupButtonPressed(context);
          },
          child: BookCard(),
        ),
        BookCard(),
        BookCard(),
        BookCard(),
        BookCard(),
        BookCard(),
        BookCard(),
        BookCard(),
      ],
    );
  }

  void _onTopupButtonPressed(context) {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      )),
      backgroundColor: primaryColor,
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Align(
                child: Icon(
                  Icons.horizontal_rule_rounded,
                  color: Color(0xFF595f93),
                  size: 50,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text(
                    'Some book name',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 20),
                  Text(
                    't is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using',
                    style: TextStyle(fontSize: 15, color: textColor),
                  ),
                ],
              ),
              QuizAmount(),
            ],
          ),
        );
      },
    );
  }
}
