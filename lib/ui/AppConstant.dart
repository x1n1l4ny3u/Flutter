import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class AppConstant {
  static Color appbarcolor = Colors.orange;
  static Color backgroundcolor = Color.fromARGB(255, 252, 74, 20);
  static TextStyle textfancyheader =
      GoogleFonts.flavors(fontSize: 40, color: Colors.deepOrange[300]);
  static TextStyle textfancyheader2 =
      GoogleFonts.flavors(fontSize: 30, color: Colors.deepOrange[300]);

  static TextStyle texterror = TextStyle(
      color: Colors.deepOrange[300], fontSize: 16, fontStyle: FontStyle.italic);
  static TextStyle texterror1 = const TextStyle(
      color: Color.fromARGB(255, 255, 102, 0),
      fontSize: 16,
      fontStyle: FontStyle.italic);
  static TextStyle textlink =
      TextStyle(color: Colors.deepOrange[300], fontSize: 16);
  static TextStyle textbody =
      TextStyle(color: Colors.deepOrange[300], fontSize: 16);
  static TextStyle textbodyWhite = 
      TextStyle(color: Colors.white,fontSize: 16);
  static TextStyle textbodyWhiteBold = 
      TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16);
  static TextStyle textbodyfocus =
      TextStyle(color: Colors.deepOrange[300], fontSize: 20);
  static TextStyle textbodyfocusWhite = 
      TextStyle(color: Colors.white,fontSize: 20);
  static bool isDate(String str) {
    try {
      var inputFormat = DateFormat('dd/MM/yyyy');
      var date1 = inputFormat.parseStrict(str);
      return true;
    } catch (e) {
      return false;
    }
  }
}
