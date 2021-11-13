import 'package:flutter/material.dart';
import 'package:islom_test/presentation/widgets/test_process/main.dart';

class TestProcesstScreen extends StatelessWidget {
  const TestProcesstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: TestProcessMain()),
    );
  }
}
