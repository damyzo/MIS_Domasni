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

  var questions = [
    {
      'question': 'Select Sweater',
      'answer': ['Springfield', 'P&B', 'POLO']
    },
    {
      'question': 'Select Jeans',
      'answer': ['Levis', 'Bershka', 'P&B']
    },
    {
      'question': 'Select shoes',
      'answer': ['Nike', 'Adidas']
    }
  ];
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
            ClothesQuestion(questions[_questionIndex]['question'].toString()),
            ...(questions[_questionIndex]['answer'] as List<String>).map((answer){
              return ClothesAnswer(answer, _iWasTapped);
            }),

          ],
        ),
      ),
    );
  }
}
