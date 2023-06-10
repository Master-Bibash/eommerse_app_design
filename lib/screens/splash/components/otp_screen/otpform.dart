import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../constants.dart';
import '../../../../size_config.dart';
import '../defaultbutton.dart';

class OtpForm extends StatefulWidget {
  @override
  State<OtpForm> createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  FocusNode? pin2FocusNode;
  FocusNode? pin3FocusNode;
  FocusNode? pin4FocusNode;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    pin2FocusNode!.dispose();
    pin3FocusNode!.dispose();
    pin4FocusNode!.dispose();

    super.dispose();
  }

  void nextfield({String? value, FocusNode? focusNode}) {
    if (value!.length == 1) {
      focusNode!.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: getProportionalScreenWidth(60),
                  child: TextFormField(
                    onChanged: (value) {
                      nextfield(value: value, focusNode: pin2FocusNode);
                    },
                    obscureText: true,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                    ),
                    inputFormatters: [LengthLimitingTextInputFormatter(1)],
                    decoration: otpInputDecorration,
                  ),
                ),
                SizedBox(
                  width: getProportionalScreenWidth(60),
                  child: TextFormField(
                    onChanged: (value) {
                      nextfield(value: value, focusNode: pin3FocusNode);
                    },
                    focusNode: pin2FocusNode,
                    obscureText: true,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                    ),
                    inputFormatters: [LengthLimitingTextInputFormatter(1)],
                    decoration: otpInputDecorration,
                  ),
                ),
                SizedBox(
                  width: getProportionalScreenWidth(60),
                  child: TextFormField(
                    focusNode: pin3FocusNode,
                    onChanged: (value) {
                      nextfield(value: value, focusNode: pin3FocusNode);
                    },
                    obscureText: true,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                    ),
                    inputFormatters: [LengthLimitingTextInputFormatter(1)],
                    decoration: otpInputDecorration,
                  ),
                ),
                SizedBox(
                  width: getProportionalScreenWidth(60),
                  child: TextFormField(
                    focusNode: pin4FocusNode,
                    obscureText: true,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                    ),
                    inputFormatters: [LengthLimitingTextInputFormatter(1)],
                    decoration: otpInputDecorration,
                    onChanged: (value) {
                      pin4FocusNode!.unfocus();
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: getProportionalScreenHeight(90),
            ),
            DefauktButton(
              press: () {},
              text: "Continue",
            )
          ],
        ),
      ),
    );
  }
}
