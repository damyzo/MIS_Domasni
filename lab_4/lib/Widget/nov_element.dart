import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lab_4/exam_date.dart';

class NovElement extends StatefulWidget {
  final Function(ExamDate item) addNewItemToList;
  NovElement(this.addNewItemToList);
  @override
  State<StatefulWidget> createState() => _NovElementState();
}

class _NovElementState extends State<NovElement> {
  late String naslov;
  late double vrednost;
  final _nameController = TextEditingController();
  final _dateController = TextEditingController();

  void _submitData() {
    if(_nameController.text.isEmpty){
      return;
    }
    final vnesenNaslov = _nameController.text;
    final vnesenaVrednost = _dateController.text;

    if(vnesenNaslov.isEmpty || vnesenaVrednost.isEmpty){
      return;
    }

    final newItem = ExamDate(name: vnesenNaslov,date: vnesenaVrednost);
    widget.addNewItemToList(newItem);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        children: [
          TextField(
            controller: _nameController,
            decoration: InputDecoration(labelText: "Naslov"),
            onSubmitted: (_) => {},
          ),
          TextField(
            controller: _dateController,
            decoration: InputDecoration(labelText: "Vrednost"),
            onSubmitted: (_) => {},
            keyboardType: TextInputType.datetime,
          ),
          TextButton(
            onPressed: () => _submitData(),
            child: Text("Submit"),
            style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Colors.blue,
                onSurface: Colors.grey),
          )
        ],
      ),
    );
  }
}
