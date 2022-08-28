import 'package:flutter/material.dart';

void showSnackBar(
    {required BuildContext context,
    required String title,
    Function()? action}) {
  final snackBar = SnackBar(
    // padding: EdgeInsets.all(20),
    backgroundColor: Colors.black,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    behavior: SnackBarBehavior.floating,
    content: Text(
      title,
    ),
    action: SnackBarAction(
      label: '',
      onPressed: action ??
          () {
            // Some code to undo the change.
          },
    ),
  );
  ScaffoldMessenger.of(context).clearSnackBars();
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
