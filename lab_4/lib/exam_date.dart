import 'package:flutter/material.dart';

class ExamDate extends StatelessWidget{
  String name;
  String date;

  ExamDate({Key? key, required this.name, required this.date}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            child: Text(
              name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            child: Text(
              date,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }




}