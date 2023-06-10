import 'package:ecommerceapz/screens/splash/components/form_error.dart';
import 'package:ecommerceapz/screens/splash/sign_uppage/signupForm.dart';
import 'package:ecommerceapz/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../../constants.dart';
import '../components/defaultbutton.dart';

class Sign_up_screen_body extends StatelessWidget {
  const Sign_up_screen_body({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionalScreenWidth(20)),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                height: SizeConfig.screenHeight! * 0.02,
              ),
              Text(
                "Register Account",
                style: TextStyle(
                    fontSize: getProportionalScreenWidth(28),
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    height: 1.5),
              ),
              Text(
                "We provide various facilities here with varous things loke shopping and providing discointsm",
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: SizeConfig.screenHeight! * 0.08,
              ),
              SignUpForm(),
              SizedBox(
                height: SizeConfig.screenHeight! * 0.08,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        // color: Colors.amber,
                        padding: EdgeInsets.symmetric(
                            horizontal: getProportionalScreenWidth(3)),
                        height: getProportionalScreenHeight(40),
                        width: getProportionalScreenWidth(40),
                        decoration: BoxDecoration(
                            color: Color(0xFF5F5F9), shape: BoxShape.circle),
                        child: Image.asset(
                          "assets/images/twitter.png",
                          width: 50,
                          height: 50,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        // color: Colors.amber,
                        padding: EdgeInsets.symmetric(
                            horizontal: getProportionalScreenWidth(3)),
                        height: getProportionalScreenHeight(40),
                        width: getProportionalScreenWidth(40),
                        decoration: BoxDecoration(
                            color: Color(0xFF5F5F9), shape: BoxShape.circle),
                        child: Image.asset(
                          "assets/images/twitter.png",
                          width: 50,
                          height: 50,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        // color: Colors.amber,
                        padding: EdgeInsets.symmetric(
                            horizontal: getProportionalScreenWidth(3)),
                        height: getProportionalScreenHeight(40),
                        width: getProportionalScreenWidth(40),
                        decoration: BoxDecoration(
                            color: Color(0xFF5F5F9), shape: BoxShape.circle),
                        child: Image.asset(
                          "assets/images/twitter.png",
                          width: 50,
                          height: 50,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: getProportionalScreenHeight(20),
              ),
              Text(
                "By continuing your confirm that you agree \nwith our Term and condition",
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
