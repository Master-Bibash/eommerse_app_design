import 'package:ecommerceapz/constants.dart';
import 'package:ecommerceapz/enum.dart';
import 'package:ecommerceapz/screens/splash/components/profile_screen/profile_body.dart';
import 'package:ecommerceapz/screens/splash/components/profile_screen/profile_screen.dart';
import 'package:ecommerceapz/screens/splash/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'customNavbar.dart';



class custom_navigator extends StatelessWidget {
  const custom_navigator({
    super.key, required this.selectedMenu,
  });
final MenuState selectedMenu;
  @override
  Widget build(BuildContext context) {
    final Color inActiveIconColor=Color(0xFFB6B6B6);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(40),
        topRight: Radius.circular(40)
      ),
      boxShadow: [
        BoxShadow(
          offset: Offset(0,-15),
          blurRadius: 20,
          color: Color(0xFFDADADA).withOpacity(1)
        )
      ]
    ),
    child: SafeArea(
      child: customNavbar(selectedMenu: selectedMenu, inActiveIconColor: inActiveIconColor),
    ),
    );
  }
}

