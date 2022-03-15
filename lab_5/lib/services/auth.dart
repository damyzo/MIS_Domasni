import 'package:firebase_auth/firebase_auth.dart';
import 'package:lab_5/models/users.dart';
class AuthService{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Stream<MyUser?> get user{
    return _auth.authStateChanges().map((User) => _userFromFirebaseUser(User));
  }
  MyUser? _userFromFirebaseUser (User? user){
    return user != null ? MyUser(uid: user.uid): null;
  }
  Future signOut() async{
    try{
      return await _auth.signOut();
    }catch(e){
      print(e.toString());
      return null;
    }
  }
  Future signInAnon() async{
    try{
      UserCredential result =  await _auth.signInAnonymously();
      return _userFromFirebaseUser(result.user);
    }catch(e){
          print(e.toString());
        return null;
    }
  }

  Future signIn(String email, String password)async{
    try{
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return _userFromFirebaseUser(_auth.currentUser);
    }catch(e){
      print(e);
      return null;
    }
  }
  Future registerWithEmailAndPassword(String email, String password)async{
    try{
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return _userFromFirebaseUser(_auth.currentUser);
    }catch(e){
      print(e);
      return null;
    }
  }
}