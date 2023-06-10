import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'OtpScreen_body.dart';

class OtpScreen extends StatelessWidget {
static String routeName="/otp";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("OTP Verification",style: TextStyle(color: Colors.black26),),
        centerTitle: true,

      ),
body: OtpScreen_body(),
    );
  }
}