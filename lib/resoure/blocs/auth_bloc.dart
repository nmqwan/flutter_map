import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:taxi_app/resoure/firebase/fireauth.dart';

class AuthBloc {
  FireAuth fireAuth = new FireAuth();
  StreamController _nameController = new StreamController();
  StreamController _phoneController = new StreamController();
  StreamController _emailController = new StreamController();
  StreamController _passwordController = new StreamController();

  Stream get nameStream => _nameController.stream;

  Stream get phoneStream => _phoneController.stream;

  Stream get passwordStream => _passwordController.stream;

  Stream get emailStream => _emailController.stream;

  bool isValid({String name, String phone, String email, String password}) {
    if (name == null || name.length < 4) {
      _nameController.sink.addError("Ten khong hop le");
      return false;
    }
    _nameController.sink.add("");
    if (phone == null || phone.length < 8) {
      _phoneController.sink.addError("So dien thoai khong hop le");
      return false;
    }
    _phoneController.sink.add("");
    if (email == null || !email.contains("@")) {
      _emailController.sink.addError("email khong hop le");
      return false;
    }
    _emailController.sink.add("");
    if (password == null || password.length < 5) {
      _passwordController.sink.addError("Mat khau phai tren 5 ky tu");
      return false;
    }
    _passwordController.sink.add("");
    return true;
  }

  void onRegister({String name,String phone,String email,String password,Function onSuccess,Function(String) onError}){
    fireAuth.onRegisterFirebase(email, password, name, phone, onSuccess,onError);
  }

  void onSignin(String email,String pass,Function(FirebaseUser) onSuccess,Function(String) onFailed){
    fireAuth.onSignIn(email, pass, onSuccess, onFailed);
  }

  void dispose(){
    _passwordController.close();
    _nameController.close();
    _emailController.close();
    _phoneController.close();
  }
}
