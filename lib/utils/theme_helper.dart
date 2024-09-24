// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recognize_text/utils/constants.dart';
// import 'package:hexcolor/hexcolor.dart';

class ThemeHelper {
  AlertDialog alertDialog(String title, String content, BuildContext context) {
    return AlertDialog(
      title: Text(
        title,
        style: GoogleFonts.aBeeZee(fontWeight: FontWeight.bold),
      ),
      content: Text(content),
      actions: [
        TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(kSecondaryColor),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            "OK",
            style: GoogleFonts.aBeeZee(color: Colors.white),
          ),
        ),
      ],
    );
  }
}

class LoginFormStyle {}
