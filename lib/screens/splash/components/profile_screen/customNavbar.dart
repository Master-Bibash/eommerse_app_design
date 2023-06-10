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





class customNavbar extends StatelessWidget {
  const customNavbar({
    super.key,
    required this.selectedMenu,
    required this.inActiveIconColor,
  });

  final MenuState selectedMenu;
  final Color inActiveIconColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(onPressed: (){ Navigator.pushNamed(context,HomeScreen.routeName);},
         icon: SvgPicture.asset("assets/icons/Shop Icon.svg",
         color: MenuState.home==selectedMenu?kPrimaryColor:inActiveIconColor,
         
         )),
              IconButton(onPressed: (){
               
              },
         icon: SvgPicture.asset("assets/icons/Heart Icon.svg", color: MenuState.favourite==selectedMenu?kPrimaryColor:inActiveIconColor,)),
              IconButton(onPressed: (){},
         icon: SvgPicture.asset("assets/icons/Chat bubble Icon.svg", color: MenuState.message==selectedMenu?kPrimaryColor:inActiveIconColor,)),
              IconButton(onPressed: (){
                Navigator.pushNamed(context,ProfileScreen.routeName);
              },
         icon: SvgPicture.asset("assets/icons/User Icon.svg", color: MenuState.profile==selectedMenu?kPrimaryColor:inActiveIconColor,)),
    
      ],
    );
  }
}