import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../size_config.dart';

class SplashContent extends StatelessWidget {
  final String text;
  final String imag;

  const SplashContent({Key? key, required this.text, required this.imag})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child:
     Column(
  mainAxisSize: MainAxisSize.min, // Set mainAxisSize to min
  children: [
    Flexible(
      fit: FlexFit.loose, // Use Flexible instead of Expanded
      child: Container(
        // child widget
      ),
    ),
    Text(
      'TOKOTO',
      style: TextStyle(
        color: Color(0xffff7643),
        fontSize: 39.5,
        fontWeight: FontWeight.bold,
      ),
    ),
    Text(
      'Welcome to Tokoto, Let\'s shop!',
      style: TextStyle(
        color: Color(0xff757575),
        fontSize: 14.0,
        fontWeight: FontWeight.normal,
      ),
      
    ),
    Image.asset(imag,height: getProportionalScreenHeight(365),
    width: getProportionalScreenWidth(235),),
    Flexible(
      fit: FlexFit.loose, // Use Flexible instead of Expanded
      child: Container(
        // child widget
      ),
    ),
  ],
)

    );
  }
}
