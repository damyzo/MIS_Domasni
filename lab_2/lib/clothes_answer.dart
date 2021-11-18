import 'package:flutter/material.dart';

class ClothesAnswer extends StatelessWidget {
  String answerText;
  Function _func;

  ClothesAnswer(this.answerText, this._func);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(answerText),
      onPressed: () => _func(),
    );
  }
}
