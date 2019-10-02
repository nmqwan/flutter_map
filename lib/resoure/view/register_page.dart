import 'package:flutter/material.dart';
import 'package:taxi_app/resoure/blocs/auth_bloc.dart';
import 'package:taxi_app/resoure/ultils/style_config.dart';
import 'package:taxi_app/resoure/view/home_page.dart';
import 'package:flutter/gestures.dart';
import 'package:taxi_app/resoure/view/dialogs/loading_dialog.dart';
import 'package:taxi_app/resoure/view/dialogs/warning_dialog.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  AuthBloc authBloc = new AuthBloc();
  TextEditingController _nameController = new TextEditingController();
  TextEditingController _phoneController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passController = new TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    authBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      appBar: AppBar(
        backgroundColor: Color(0xffffff),
        iconTheme: IconThemeData(color: Colors.blue),
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 100, 0, 0),
                    child: Image.asset("ic_car_red.png"),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                    child: Text(
                      "Welcome Aboard",
                      style: TextStyle(fontSize: 22, color: Colors.black),
                    ),
                  ),
                  Text("Sign up with iCar in simple step")
                ],
              ),
              Column(
                children: <Widget>[
                  Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                      child: StreamBuilder(
                        stream: authBloc.nameStream,
                        builder: (context, snap) => TextField(
                          controller: _nameController,
                          style: TextStyle(fontSize: StyleConfig.edtFontSize),
                          decoration: InputDecoration(
                              labelText: "Name",
                              errorText: snap.hasError ? snap.error : null,
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(1))),
                              prefixIcon: Container(
                                  width: 40,
                                  child: Image.asset("ic_user.png"))),
                        ),
                      )),
                  Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                      child: StreamBuilder(
                        stream: authBloc.phoneStream,
                        builder: (context, snap) => TextField(
                          controller: _phoneController,
                          style: TextStyle(fontSize: StyleConfig.edtFontSize),
                          decoration: InputDecoration(
                              errorText: snap.hasError ? snap.error : null,
                              labelText: "Phone number",
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(1))),
                              prefixIcon: Container(
                                  width: 40,
                                  child: Image.asset("ic_phone.png"))),
                        ),
                      )),
                  Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                      child: StreamBuilder(
                        stream: authBloc.emailStream,
                        builder: (context, snap) => TextField(
                          controller: _emailController,
                          style: TextStyle(fontSize: StyleConfig.edtFontSize),
                          decoration: InputDecoration(
                              errorText: snap.hasError ? snap.error : null,
                              labelText: "Email",
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(1))),
                              prefixIcon: Container(
                                  width: 40,
                                  child: Image.asset("ic_mail.png"))),
                        ),
                      )),
                  Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                      child: StreamBuilder(
                        stream: authBloc.passwordStream,
                        builder: (context, snap) => TextField(
                          controller: _passController,
                          obscureText: true,
                          style: TextStyle(fontSize: StyleConfig.edtFontSize),
                          decoration: InputDecoration(
                              errorText: snap.hasError ? snap.error : null,
                              labelText: "Password",
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(1))),
                              prefixIcon: Container(
                                  width: 40,
                                  child: Image.asset("ic_lock.png"))),
                        ),
                      )),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: RaisedButton(
                        onPressed: onSignUp,
                        child: Text("Sign Up"),
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
                            text: "Already a user ? ",
                            style:
                                TextStyle(color: Colors.black, fontSize: 18)),
                        TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pop(context);
                              },
                            text: "Login now",
                            style: TextStyle(color: Colors.blue, fontSize: 18)),
                      ]),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  onSignUp() {
    if (authBloc.isValid(
        name: _nameController.text,
        email: _emailController.text,
        password: _passController.text,
        phone: _phoneController.text)) {
      LoadingDialog.showLoading(context, true, 'Loading');
      authBloc.onRegister(
          phone: _phoneController.text,
          password: _passController.text,
          email: _emailController.text,
          name: _nameController.text,
          onSuccess: () {
            LoadingDialog.hideDialog(context);
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          },
          onError: (mesg) {
            LoadingDialog.hideDialog(context);
            WarningDialog.showWarningDialog(
                context: context, mesg: mesg, title: "Sign up failed");
          });
    }
  }
}
