import 'package:flutter/material.dart';

import '../../constants.dart';

ThemeData theme(){
  return ThemeData(
    
        scaffoldBackgroundColor: Colors.white,
        fontFamily: "Muli",
        appBarTheme: const AppBarTheme(
          color: Colors.white,
          elevation: 0,
          brightness: Brightness.light,
          iconTheme: IconThemeData(color: Colors.black),
          textTheme: TextTheme(
            headline6: TextStyle(color: Color(0xFF8B8B8B), fontSize: 19),
          ),
        ),
        textTheme: TextTheme(
          bodyText1: TextStyle(color: kTextColor),
          bodyText2: TextStyle(color: kTextColor),
        ),
        inputDecorationTheme: inputdecotationtheme(),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      );
}

InputDecorationTheme inputdecotationtheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(

              borderRadius: BorderRadius.circular(28),
              borderSide: BorderSide(color: kTextColor),
              gapPadding:10, 
              
            );
  return InputDecorationTheme(
            // iconColor: kPrimaryColor,
            // labelText: "Email",
            // hintText: "Enter your email",
            // floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 42,
            vertical: 20
          ),
            enabledBorder: outlineInputBorder,
            focusedBorder: outlineInputBorder,
            border: outlineInputBorder,
          );
}