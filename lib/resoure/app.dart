import 'package:flutter/material.dart';
import 'package:taxi_app/resoure/view/login_page.dart';

import 'blocs/auth_bloc.dart';

class MyApp extends InheritedWidget {

  AuthBloc authBloc;
  Widget child;


  MyApp(this.authBloc, this.child):super(child:child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return false;
  }

  static MyApp of(BuildContext context){
   return context.inheritFromWidgetOfExactType(MyApp);
  }
}
