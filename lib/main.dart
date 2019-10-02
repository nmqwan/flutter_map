import 'package:flutter/material.dart';
import 'package:taxi_app/resoure/app.dart';
import 'package:taxi_app/resoure/blocs/auth_bloc.dart';
import 'package:taxi_app/resoure/view/home_page.dart';
import 'package:taxi_app/resoure/view/login_page.dart';
import 'package:taxi_app/resoure/view/widget/ride_picker_page.dart';

void main() =>

    runApp(MyApp(new AuthBloc(), MaterialApp(
      theme: ThemeData(
          textTheme: TextTheme(
              body1: TextStyle(fontSize: 16),
              body2: TextStyle(fontSize: 16),
              button: TextStyle(fontSize: 18)),
          buttonTheme: ButtonThemeData(
            buttonColor: Colors.blue,
            textTheme: ButtonTextTheme.primary,
          )),
      home: LoginPage(),
    )));
