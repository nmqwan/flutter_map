import 'package:flutter/material.dart';

class LoadingDialog {
  static void showLoading(BuildContext context, bool isCancel, String mesg) {
    showDialog(
      context: context,
      barrierDismissible: isCancel,
      builder: (context) => Dialog(
          child: Container(
        color: Colors.white,
        height: 100,
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircularProgressIndicator(),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Text(
                mesg,
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
            )
          ],
        ),
      )),
    );
  }

  static void hideDialog(BuildContext context) {
    Navigator.of(context).pop(LoadingDialog);
  }
}
