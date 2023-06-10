import 'package:ecommerceapz/constants.dart';
import 'package:ecommerceapz/screens/splash/sign_uppage/signup_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SignUpScreen extends StatelessWidget {
static String routName="/sign_up";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up",style: TextStyle(color: Colors.black26,
        
        ),
        
        
        ),
        
        
        
      ),
      body: Sign_up_screen_body(),
    );
    
    
  
  }
  
  
  
}