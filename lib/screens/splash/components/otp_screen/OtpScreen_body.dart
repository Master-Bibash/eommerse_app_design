import 'package:ecommerceapz/constants.dart';
import 'package:ecommerceapz/screens/splash/components/defaultbutton.dart';
import 'package:ecommerceapz/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'otpform.dart';

class OtpScreen_body extends StatelessWidget {
  const OtpScreen_body({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
                      SizedBox(height: SizeConfig.screenHeight! * 0.05 ,),
      
            Text(
              "OTP Verification",
              style: headingStyle,
            ),
            Text("We sent your code to +1 984 333 ***"),
            buildTimer(),
            SizedBox(
              height: SizeConfig.screenHeight! * 0.15,
            ),
            OtpForm(),
            SizedBox(
              height: SizeConfig.screenHeight! * 0.15,
            ),
            GestureDetector(
              onTap: (){},
              child: Text(
                "Resend OTP Code",
                style: TextStyle(decoration: TextDecoration.underline),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row buildTimer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("this code will expire in "),
        TweenAnimationBuilder(
          tween: Tween(begin: 30.0, end: 0),
          duration: Duration(seconds: 30),
          builder: (context, value, child) => Text(
            "00:${value.toInt()}",
            style: TextStyle(color: kPrimaryColor),
          ),
          onEnd: () {},
        )
      ],
    );
  }
}

