import 'package:flutter/material.dart';

class AppWidget {
  static TextStyle boldTextFieldStyle() {
    return TextStyle(
      color: Colors.black,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      fontFamily: 'Poppins',
    );
  }

  static TextStyle headlineTextFieldStyle() {
    return TextStyle(
      color: Colors.black,
      fontSize: 24.0,
      fontWeight: FontWeight.bold,
      fontFamily: 'Poppins',
    );
  }

  static TextStyle buttonText() {
    return TextStyle(
      color: Colors.white,
      fontSize: 19.0,
      fontFamily: 'Poppins1',
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle lightTextFieldStyle() {
    return TextStyle(
      color: Colors.black54,
      fontSize: 15.0,
      fontWeight: FontWeight.w500,
      fontFamily: 'Poppins',
    );
  }

  static TextStyle subjectExplain() {
    return TextStyle(
      color: Colors.grey,
      fontSize: 12.0,
      fontWeight: FontWeight.w500,
      fontFamily: 'Poppins',
    );
  }

  static TextStyle semiBoldTextFieldStyle() {
    return TextStyle(
      color: Colors.black,
      fontSize: 18.0,
      fontWeight: FontWeight.w500,
      fontFamily: 'Poppins',
    );
  }
}


//Colors
const blue = Color.fromARGB(255, 32, 67, 224);
const darkBlue = Color(0xFF3442AF);
const bgColor = Color(0xFFE4ECFA);
const lightGrey = Color(0xFFB8C6E6);
const backgroundColor = Color.fromRGBO(16, 13, 34, 1);


Widget normalText(
    String? text,
    Color? color,
    double? size,
    ) {
  return Text(
    text!,
    style: TextStyle(
      fontFamily: "quick_semi",
      fontSize: size,
      color: color,
    ),
  );
}

Widget headingText(
    String? text,
    Color? color,
    double? size,
    ) {
  return Text(
    text!,
    style: TextStyle(
      fontWeight: FontWeight.bold,
      fontFamily: 'Poppins',
      fontSize: size,
      color: color,
    ),
  );
}