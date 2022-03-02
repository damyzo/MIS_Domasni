import 'package:flutter/material.dart';
import 'package:lab_4/authentication_service.dart';
import 'package:lab_4/exam_date.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lab_4/sign_in_page.dart';
import 'package:provider/provider.dart';
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
    return MultiProvider(
      providers:
        [Provider<AuthenticationService>(
          create: (_) => AuthenticationService(FirebaseAuth.instance)
        ),
          StreamProvider(create: (context) => context.read<AuthenticationService>().authStateChanges, initialData: null,
          )
        ]
    );
  }
}
class AuthenticationWrapper extends StatelessWidget{
  const AuthenticationWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();
    if(firebaseUser != null ){
      return const MyHomePage(title: "185025");
    }
    return SignInPage();
  }

}
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String title = "Lab 4 185025";
  final name_controler = TextEditingController();
  final date_controler = TextEditingController();
  List<Widget> elem = [];




  @override
  Widget build(BuildContext context) {
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
            onPressed: () {
              if(name_controler.text.isNotEmpty && date_controler.text.isNotEmpty){
                setState(() {
                  elem.add(ExamDate(name: name_controler.text, date: date_controler.text));
                });

              }
            },
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            child: TextField(
              controller: name_controler,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Enter Name of Exam'),
            ),
            padding: const EdgeInsets.all(5),
          ),
          Padding(
            child: TextField(
              controller: date_controler,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Enter Date of Exam'),
            ),
            padding: const EdgeInsets.all(5),
          ),
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
