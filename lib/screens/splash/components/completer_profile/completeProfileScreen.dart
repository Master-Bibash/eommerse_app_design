import 'package:ecommerceapz/screens/splash/components/body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'completeScreenBody.dart';

class CompleteProfileScreen extends StatelessWidget {
  static String routeName = "/complete_profile";
  // const CompleteProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up",style:TextStyle(color:  Colors.black26,fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: completeScreenBody(),
    );
  }
}