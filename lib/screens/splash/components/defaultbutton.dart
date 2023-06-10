import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class DefauktButton extends StatelessWidget {
  final void Function() press;
  final String text;

  DefauktButton({required this.press, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: getProportionalScreenHeight(56),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: kPrimaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20))),
          onPressed: press,
          child: Text(
            (text),
            style: TextStyle(
              fontSize: getProportionalScreenWidth(18),
              color: Colors.white,
            ),
          )),
    );
  }
}
