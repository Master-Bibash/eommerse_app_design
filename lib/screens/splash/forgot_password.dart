import 'package:ecommerceapz/screens/splash/forgot_password_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ForgotPassword extends StatelessWidget {
  // const ForgotPassword({super.key});

static String routName="/forgot_password";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Forgot password",style: TextStyle(color: Colors.black26,fontWeight: FontWeight.bold)
        ,),
        
      ),
      body: Forgot_password_body(),
    );
  }
}