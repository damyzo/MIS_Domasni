import 'package:flutter/material.dart';
import 'package:lab_4/services/auth.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.red,
        elevation: 0.0,
        title: Text("Sign in"),
      ),
      body: Container(
        child: ElevatedButton(
            child: const Text("Sign in anon"),
            onPressed: () async{
             dynamic result =  await _auth.signInAnon();
             if(result == null){
               print('Error siging in');
             }else{
               print('Signed in');
               print(result);
             }
            },
            style: ElevatedButton.styleFrom(
              textStyle: const TextStyle(fontSize: 20),
            ),
            ),
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 50,
        ),

      ),
    );
  }
}
