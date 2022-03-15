import 'package:flutter/material.dart';
import 'package:lab_4/authenticate/sign_in_page.dart';

import 'home/home.dart';
import 'main.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SignIn();
  }
}
