import 'package:ecommerceapz/screens/splash/sign_uppage/sign_upscreen.dart';
import 'package:flutter/cupertino.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
import '../forgot_password.dart';

class noaccount extends StatelessWidget {
  const noaccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Dont have an account?",
        style: TextStyle(fontSize: getProportionalScreenWidth(16)),),
          GestureDetector(
            onTap: (){
              Navigator.popAndPushNamed(context, SignUpScreen.routName);
            },
            child: Text("Sign Up",
                  style: TextStyle(fontSize: getProportionalScreenWidth(16),color: kPrimaryColor),),
          ),
          
      ],
    );
  }
}