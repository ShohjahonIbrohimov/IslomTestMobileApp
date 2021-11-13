import 'package:flutter/material.dart';
import 'package:islom_test/presentation/widgets/books_list/main.dart';

class BooksListScreen extends StatelessWidget {
  const BooksListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: BooksListMain()),
    );
  }
}
