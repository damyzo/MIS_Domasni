import 'package:flutter/material.dart';
import 'package:lab_5/services/auth.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key, required this.toggleView}) : super(key: key);
  final Function toggleView;
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String password = '';
  String email = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [TextButton(onPressed: (){
          widget.toggleView();
        }, child: Text("Register",style: TextStyle(color: Colors.white),))],
        backgroundColor: Colors.red,
        elevation: 0.0,
        title: Text("Sign in for this app"),
      ),
      body: Container(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(hintText: "Enter email"),

                validator: (val){
                  if(val != null)
                  {
                    return val.isEmpty?"Enter email":null;
                  }else{
                    return null;
                  }
                },
                onChanged: (val) {
                  setState(() {
                    email = val;
                  });
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(hintText: "Enter password"),
                validator: (val){
                  if(val != null)
                  {
                    return val.length < 6?"Enter 6+ characters":null;
                  }else{
                    return null;
                  }
                },
                onChanged: (val) {
                  setState(() {
                    password = val;
                  });

                },
                obscureText: true,
              ),
              SizedBox(
                height: 20,
              ),
              TextButton(
                onPressed: () async {
                  if(_formKey.currentState!.validate()){
                    dynamic result = await _auth.signIn(email, password);
                    if(result == null){
                      print("error loggin in user");
                    }else{
                      print("succsesfuly loggedin user");
                    }
                  }
                },
                child: Text(
                  "Sign in",
                  style: TextStyle(color: Colors.white),
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red),
                    foregroundColor: MaterialStateProperty.all(Colors.red)),
              )
            ],
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
