import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

SnackBar successSnackBar(String message) {
  SnackBar snackBar = SnackBar(
    elevation: 0,
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    padding: EdgeInsets.symmetric(horizontal: 0, vertical: 13),
    duration: Duration(seconds: 2),
    content: AwesomeSnackbarContent(
      color: Color(0xFF452CE8),
      title: 'Yay!',
      messageTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 13,
        fontWeight: FontWeight.w400,
      ),
      message: message,
      contentType: ContentType.success,
    ),
  );
  return snackBar;
}

SnackBar errorSnackBar(String message) {
  SnackBar snackBar = SnackBar(
    elevation: 0,
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    padding: EdgeInsets.symmetric(horizontal: 0, vertical: 13),
    duration: Duration(seconds: 10),
    content: AwesomeSnackbarContent(
      color: Color(0xFF452CE8),
      title: 'Oops!',
      messageTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 13,
        fontWeight: FontWeight.w400,
      ),
      message: message,
      contentType: ContentType.success,
    ),
  );
  return snackBar;
}
