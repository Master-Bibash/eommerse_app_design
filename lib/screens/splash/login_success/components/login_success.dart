import 'package:ecommerceapz/screens/splash/components/body.dart';
import 'package:ecommerceapz/screens/splash/login_success/components/body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class LoginSuccessScreen extends StatelessWidget {

static String routeName="\login_success";
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
        title: Text("Login Success",style: TextStyle(color: Colors.black26),),
        centerTitle: true,
      ),
      body: login_success_body(),

    );
  }
}