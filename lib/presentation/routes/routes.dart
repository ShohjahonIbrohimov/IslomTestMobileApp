import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islom_test/presentation/screens/books_screen.dart';
import 'package:islom_test/presentation/screens/test_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const BooksListScreen());
      case '/test':
        return MaterialPageRoute(builder: (_) => const TestProcesstScreen());
    }

    return MaterialPageRoute(builder: (_) => const BooksListScreen());
  }
}
