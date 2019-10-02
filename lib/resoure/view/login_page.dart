import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:taxi_app/resoure/blocs/auth_bloc.dart';
import 'package:taxi_app/resoure/ultils/style_config.dart';
import 'package:taxi_app/resoure/view/register_page.dart';
import 'package:flutter/gestures.dart';

import '../app.dart';
import 'dialogs/loading_dialog.dart';
import 'dialogs/warning_dialog.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailCOntroller = new TextEditingController();
  TextEditingController _passController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
        constraints: BoxConstraints.expand(),
        child: Column(
          children: <Widget>[
            Flexible(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 60, 0, 0),
                    child: Image.asset('ic_car_green.png'),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                    child: Text(
                      "Welcome Back",
                      style: TextStyle(fontSize: 22, color: Colors.black),
                    ),
                  ),
                  Text("Login to continue using iCar"),
                ],
              ),
            ),
            Flexible(
              flex: 2,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 60, 0, 10),
                    child: TextField(
                      controller: _emailCOntroller,
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(fontSize: StyleConfig.edtFontSize),
                      decoration: InputDecoration(
                          labelText: "Email",
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black12),
                            borderRadius: BorderRadius.all(Radius.circular(1)),
                          ),
                          prefixIcon: Container(
                            width: 40,
                            child: Image.asset("ic_mail.png"),
                          )),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: TextField(
                      controller: _passController,
                      obscureText: true,
                      style: TextStyle(fontSize: StyleConfig.edtFontSize),
                      decoration: InputDecoration(
                          labelText: "Password",
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black12),
                            borderRadius: BorderRadius.all(Radius.circular(1)),
                          ),
                          prefixIcon: Container(
                            width: 40,
                            child: Image.asset("ic_phone.png"),
                          )),
                    ),
                  ),
                  Container(
                    constraints:
                        BoxConstraints.loose(Size(double.infinity, 30)),
                    alignment: AlignmentDirectional.centerEnd,
                    child: Text(
                      "Forgot password ?",
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: RaisedButton(
                        onPressed: onLogin,
                        child: Text("Log In"),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                    child: RichText(
                      text: TextSpan(children: <TextSpan>[
                        TextSpan(
                            text: "New user? ",
                            style:
                                TextStyle(color: Colors.black, fontSize: 18)),
                        TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => RegisterPage()));
                              },
                            text: "Sign up a new user",
                            style: TextStyle(color: Colors.blue, fontSize: 18)),
                      ]),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  onLogin() {
    String email = _emailCOntroller.text, pass = _passController.text;
    AuthBloc authBloc = MyApp.of(context).authBloc;
    LoadingDialog.showLoading(context, true, "Loading ...");
    authBloc.onSignin(email, pass, (FirebaseUser) {
      log('123123');
      LoadingDialog.hideDialog(context);

      Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
    }, (msg) {
      LoadingDialog.hideDialog(context);
      WarningDialog.showWarningDialog(context: context,title:'Sign in' ,mesg: msg);
    });
  }
}
