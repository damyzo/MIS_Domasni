import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lab_5/exam_date.dart';
import 'package:lab_5/home/home.dart';
import 'package:lab_5/models/users.dart';
import 'package:lab_5/services/auth.dart';
import 'package:lab_5/wrapper.dart';
import 'package:provider/provider.dart';

import 'Widget/nov_element.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<MyUser?>.value(
      value: AuthService().user,
      initialData: null,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: const Wrapper(),
      ),
    );
  }
}
