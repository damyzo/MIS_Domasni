import 'package:flutter/material.dart';

class ClothesAnswer extends StatelessWidget {
  String answerText;
  Function _func;

  ClothesAnswer(this.answerText, this._func);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
        child:ElevatedButton(
      child: Text(answerText, style: const TextStyle(fontSize: 20, color: Colors.red),),
      style: ElevatedButton.styleFrom(primary: Colors.green),
      onPressed: () => _func(),)

    );
  }
}
