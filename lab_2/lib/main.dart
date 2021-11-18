import 'package:flutter/material.dart';
import './clothes_question.dart';
import './clothes_answer.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  void _iWasTapped() {
    setState(() {
      _questionIndex += 1;
      if (_questionIndex == questions.length) {
        _questionIndex = 0;
      }
    });
    print("I was tapped");
  }

  var questions = ['question1', 'question2', 'question3'];
  var _questionIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Hello World",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Hallo World"),
        ),
        body: Column(
          children: [
            ClothesQuestion(questions[_questionIndex]),
            ClothesAnswer('Tap me 1', _iWasTapped),
            ClothesAnswer('Tap me 2', _iWasTapped),
            ClothesAnswer('Tap me 3', _iWasTapped),
          ],
        ),
      ),
    );
  }
}
