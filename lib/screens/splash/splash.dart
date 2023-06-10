import 'package:ecommerceapz/screens/splash/components/body.dart';
import 'package:ecommerceapz/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Splash extends StatelessWidget {
  static String routeName="/splash";

  @override
  Widget build(BuildContext context) {
    //call it on the starting screen
    SizeConfig.init(context);
    // FocusManager.instance.primaryFocus?.unfocus();
    return  Scaffold(
      resizeToAvoidBottomInset: true,
      body: Body(),
    );
  }
}