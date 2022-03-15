import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lab_4/exam_date.dart';
import 'package:lab_4/home/home.dart';
import 'package:lab_4/wrapper.dart';

import 'Widget/nov_element.dart';

Future<void> main() async {
  await Firebase.initializeApp();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const Wrapper(),
    );
  }
}