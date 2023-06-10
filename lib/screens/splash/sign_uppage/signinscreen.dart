import 'package:ecommerceapz/screens/splash/sign_uppage/signinbody.dart';
import 'package:ecommerceapz/screens/splash/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  static const String routeName = '/sign_in'; // Use 'static const' for routeName

  @override
  Widget build(BuildContext context) {
    // Your sign-in screen implementation
    return Scaffold(
      
      appBar: AppBar(centerTitle: true,
        title: Text("Sign In",style: TextStyle(color: Color(0xFF8B8B8B)),),
      ),
      body: SignInBody(),
      
    );
  }
}
