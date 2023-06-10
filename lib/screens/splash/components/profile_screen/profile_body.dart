import 'package:ecommerceapz/screens/splash/components/profile_screen/profile_info.dart';
import 'package:ecommerceapz/screens/splash/components/profile_screen/profile_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profilebody extends StatelessWidget {
  const Profilebody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          Center(child: profile_info()),
          SizedBox(
            height: 20,
          ),
          profile_menu(
              icon: "assets/icons/User Icon.svg",
              press: () {},
              text: "My Account"),
          SizedBox(
            height: 10,
          ),
            profile_menu(
              icon: "assets/icons/Question mark.svg",
              press: () {},
              text: "Settings"),
          SizedBox(
            height: 10,
          ),
          profile_menu(
              icon: "assets/icons/Bell.svg",
              press: () {},
              text: "Notifications"),
          SizedBox(
            height: 10,
          ),
          profile_menu(
              icon: "assets/icons/User Icon.svg",
              press: () {},
              text: "Help Center"),
          SizedBox(
            height: 10,
          ),
          profile_menu(
              icon: "assets/icons/Log out.svg",
              press: () {},
              text: "Log Out"),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}


