import 'package:ecommerceapz/constants.dart';
import 'package:ecommerceapz/enum.dart';
import 'package:ecommerceapz/screens/splash/components/profile_screen/profile_body.dart';
import 'package:ecommerceapz/screens/splash/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'customicon.dart';


class ProfileScreen extends StatelessWidget {
  static String routeName="/profile";
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Title",style: TextStyle(color: Colors.black),),centerTitle: true,),
      body: Profilebody(),
      bottomNavigationBar: custom_navigator(selectedMenu: MenuState.profile)
      ,
    );
  }
}

