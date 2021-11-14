import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:islom_test/data/models/quiz_model.dart';

Future<List<QuizModel>> fetchQuizzes(amount) async {
  final response = await http.get(Uri.parse(
      'https://opentdb.com/api.php?amount=$amount&category=24&difficulty=medium&type=multiple'));

  print(response.statusCode);
  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body)['results'];
    return jsonResponse.map((data) => QuizModel.fromJson(data)).toList();
  } else {
    throw Exception('Failed to load Quizzes');
  }
}
