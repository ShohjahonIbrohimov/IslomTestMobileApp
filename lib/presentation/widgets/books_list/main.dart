import 'package:flutter/material.dart';
import 'package:islom_test/presentation/config/size_config.dart';
import 'package:islom_test/presentation/widgets/books_list/book_search.dart';
import 'package:islom_test/presentation/widgets/books_list/books_list.dart';
import 'package:islom_test/presentation/widgets/books_list/bottom_nav.dart';

class BooksListMain extends StatelessWidget {
  const BooksListMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
      children: const [
        BookSearch(),
        Expanded(flex: 2, child: BooksList()),
        BottomNavigation()
      ],
    );
  }
}
