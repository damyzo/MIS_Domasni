import 'package:flutter/material.dart';
import 'package:lab_5/authenticate/authenticate.dart';
import 'package:lab_5/authenticate/sign_in_page.dart';
import 'package:lab_5/models/users.dart';
import 'package:provider/provider.dart';

import 'home/home.dart';
import 'main.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyUser?>(context);
    if(user != null){
      return const MyHomePage(title: "185025 Damjan Ilievski");
    }else{
      return const Authenticate();

    }
  }
}
