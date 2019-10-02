import 'package:flutter/material.dart';

class WarningDialog {
  static showWarningDialog({BuildContext context, String title, String mesg}) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) => AlertDialog(
              title: Text(title),
              content: Text(mesg),
              actions: <Widget>[
                FlatButton(
                  child: Text("OK"),
                  onPressed: (){
                    Navigator.of(context).pop(WarningDialog);
                  },
                )
              ],
            ));
  }
}
