import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';

class FireAuth {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseDatabase firebaseDatabase = FirebaseDatabase.instance;

  void onRegisterFirebase(String email, String password, String name,
      String phone, Function onSuccess, Function(String) onError) {
    firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((user) {
      onCreateUser(user.uid, name, phone, onSuccess);
    }).catchError((err) {
      onError(_showErrorRegister(err.code));
    });
  }

  onCreateUser(String userID, String name, String phone, Function onSuccess) {
    var user = {name: name, phone: phone};
    firebaseDatabase
        .reference()
        .child('users')
        .child(userID)
        .set(user)
        .then((user) {
      onSuccess();
    }).catchError((err) => {});
  }

  onSignIn(String email, String pass, Function(FirebaseUser) onSuccess,
      Function(String) onErr) {
    firebaseAuth
        .signInWithEmailAndPassword(email: email, password: pass)
        .then((user) {
      onSuccess(user);
    }).catchError((err) {
      onErr("Login failed, pls try again");
    });
  }

  ///      ERROR_WEAK_PASSWORD` - If the password is not strong enough.
  ///   • `ERROR_INVALID_EMAIL` - If the email address is malformed.
  ///   • `ERROR_EMAIL_ALREADY_IN_USE` - If the email is already in use by a different account.

  String _showErrorRegister(String code) {
    switch (code) {
      case 'ERROR_WEAK_PASSWORD':
        return 'The password is not strong enough';
      case 'ERROR_INVALID_EMAIL':
        return 'The email address is malformed';
      case 'ERROR_EMAIL_ALREADY_IN_USE':
        return 'The email is already in use by a different account';
      default:
        return 'Sign up failed, please try again';
    }
  }
}
