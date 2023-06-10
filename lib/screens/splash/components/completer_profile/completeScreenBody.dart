import 'package:ecommerceapz/constants.dart';
import 'package:ecommerceapz/screens/splash/components/defaultbutton.dart';
import 'package:ecommerceapz/screens/splash/components/form_error.dart';
import 'package:ecommerceapz/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'complete_profile_form.dart';

class completeScreenBody extends StatelessWidget {
  const completeScreenBody({super.key});

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
                          SizedBox(height: SizeConfig.screenHeight! * 0.05,),
        
              Text(
                "Completer Profile",
                style: headingStyle,
              ),
              Text(
                "Completer your details or continue \with social media",
                textAlign: TextAlign.center,
              ),
              SizedBox(height: SizeConfig.screenHeight! * 0.05,),
              CompleteProfileForm(),
              SizedBox(height: getProportionalScreenHeight(30),),
              Text("By continuing your confirm that you agree /nwith our Term and Condition",style: TextStyle(),textAlign: TextAlign.center,),
            ],
          ),
        ),
      ),
    );
  }
}

