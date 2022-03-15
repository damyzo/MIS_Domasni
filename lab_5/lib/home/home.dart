import 'package:flutter/material.dart';
import 'package:lab_5/Widget/nov_element.dart';
import 'package:lab_5/services/auth.dart';

import '../exam_date.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String title = "Lab 4 185025";
  List<Widget> elem = [];

  void _addNewItemToList(ExamDate item) {
    setState(() {
      elem.add(item);
    });
  }

  void _addItemFunction(BuildContext ct) {

    showModalBottomSheet(
      context: ct,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NovElement(_addNewItemToList),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    final AuthService _auth = AuthService();
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          IconButton(
            onPressed: ()=>_addItemFunction(context),
            icon: const Icon(Icons.add),
          ), IconButton(
            onPressed: ()async{
              await _auth.signOut();
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Column(
        children: [

          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: elem.length,
              itemBuilder: (contx, index) {
                return elem[index];
              },
            ),
          ),
        ],
      ),
    );
  }
}
